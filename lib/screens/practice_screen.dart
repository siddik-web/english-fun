import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/theme.dart';
import '../data/word_pairs_data.dart';
import '../models/word_pair.dart';
import '../services/tts_service.dart';
import '../services/stt_service.dart';
import '../services/progress_provider.dart';
import '../services/gemini_service.dart';
import '../services/openai_service.dart';
import '../widgets/progress_bar.dart';
import '../widgets/word_card.dart';
import '../widgets/listen_button.dart';
import '../widgets/record_button.dart';
import '../widgets/feedback_overlay.dart';

class PracticeScreen extends StatefulWidget {
  final String category;

  const PracticeScreen({super.key, required this.category});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  late List<WordPair> _pairs;
  int _currentPairIndex = 0;
  int _targetWordIndex = 0; // 0 or 1 - which word to speak
  int? _selectedWordIndex;
  bool _showFeedback = false;
  bool _isCorrect = false;
  bool _isListening = false;
  bool _isGenerating = false;
  int _cooldownSeconds = 0;
  Timer? _cooldownTimer;
  String? _mouthHint;
  
  late TTSService _ttsService;
  late STTService _sttService;
  StreamSubscription<String>? _sttSubscription;

  @override
  void initState() {
    super.initState();
    _pairs = WordPairsData.getPairsByCategory(widget.category);
    _pairs.shuffle();
    _selectRandomTarget();
    
    _ttsService = context.read<TTSService>();
    _sttService = context.read<STTService>();
    
    _sttSubscription = _sttService.recognizedWords.listen(_onSpeechResult);
  }

  @override
  void dispose() {
    _sttSubscription?.cancel();
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _selectRandomTarget() {
    _targetWordIndex = Random().nextInt(2);
    _selectedWordIndex = null;
    _mouthHint = null;
  }

  WordPair get _currentPair => _pairs[_currentPairIndex];
  String get _targetWord => _currentPair.getWord(_targetWordIndex);
  bool get _isComplete => _currentPairIndex >= _pairs.length;

  void _playTargetWord() {
    _ttsService.speak(_targetWord);
  }

  void _onWordCardTapped(int index) {
    setState(() {
      _selectedWordIndex = index;
    });
    _checkAnswer(index);
  }

  void _checkAnswer(int selectedIndex) {
    final progress = context.read<ProgressProvider>();
    final isCorrect = selectedIndex == _targetWordIndex;

    setState(() {
      _isCorrect = isCorrect;
      _showFeedback = true;
      if (!isCorrect) {
        _mouthHint = _currentPair.getMouthHint(_targetWordIndex);
      }
    });

    if (isCorrect) {
      progress.recordCorrectAnswer();
    } else {
      progress.recordIncorrectAnswer();
    }
  }

  void _onSpeechResult(String spokenText) {
    if (!mounted) return;
    
    final isCorrect = _sttService.compareWords(spokenText, _targetWord);
    final progress = context.read<ProgressProvider>();

    setState(() {
      _isCorrect = isCorrect;
      _showFeedback = true;
      _isListening = false;
      if (!isCorrect) {
        _mouthHint = _currentPair.getMouthHint(_targetWordIndex);
      }
    });

    if (isCorrect) {
      progress.recordCorrectAnswer();
    } else {
      progress.recordIncorrectAnswer();
    }
  }

  void _onFeedbackComplete() {
    if (_isCorrect) {
      _nextPair();
    } else {
      setState(() {
        _showFeedback = false;
      });
    }
  }

  void _nextPair() {
    final progress = context.read<ProgressProvider>();
    progress.completePair(widget.category);

    if (_currentPairIndex < _pairs.length - 1) {
      setState(() {
        _currentPairIndex++;
        _showFeedback = false;
        _selectRandomTarget();
      });
    } else {
      // All pairs completed
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppTheme.secondaryYellow,
        title: const Text(
          '🎉 Great Job! 🎉',
          textAlign: TextAlign.center,
          style: AppTheme.headingStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You completed all the pairs!',
              textAlign: TextAlign.center,
              style: AppTheme.bodyStyle,
            ),
            const SizedBox(height: 16),
            Text(
              '⭐ ${context.read<ProgressProvider>().correctAnswers} correct answers!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.successGreen,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: AppTheme.primaryButton,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateMoreWords() async {
    if (_cooldownSeconds > 0) {
      _showMessage('Please wait $_cooldownSeconds seconds before generating more.');
      return;
    }

    // Check which provider is configured
    final prefs = await SharedPreferences.getInstance();
    final provider = prefs.getString('ai_provider') ?? 'openai';
    
    bool isInitialized = false;
    if (provider == 'openai') {
      isInitialized = OpenAIService.instance.isInitialized;
      
      // If not initialized but we have saved settings, initialize now
      if (!isInitialized) {
        final apiKey = prefs.getString('openai_api_key');
        final model = prefs.getString('openai_model') ?? 'gpt-3.5-turbo';
        
        if (apiKey != null && apiKey.isNotEmpty) {
          try {
            OpenAIService.instance.initialize(
              apiKey: apiKey,
              model: model,
            );
            isInitialized = true;
          } catch (e) {
            _showMessage('Failed to initialize OpenAI: ${e.toString()}');
            return;
          }
        }
      }
    } else {
      isInitialized = GeminiService.instance.isInitialized;
      
      // If not initialized but we have saved settings, initialize now
      if (!isInitialized) {
        final apiKey = prefs.getString('gemini_api_key');
        final model = prefs.getString('gemini_model') ?? 'gemini-2.0-flash';
        
        if (apiKey != null && apiKey.isNotEmpty) {
          try {
            GeminiService.instance.initializeWithSettings(
              apiKey: apiKey,
              model: model,
            );
            isInitialized = true;
          } catch (e) {
            _showMessage('Failed to initialize Gemini: ${e.toString()}');
            return;
          }
        }
      }
    }
    
    if (!isInitialized) {
      _showMessage('AI not configured. Add your API key to settings!');
      return;
    }

    setState(() {
      _isGenerating = true;
    });

    try {
      List<WordPair> newPairs;
      
      if (provider == 'openai') {
        newPairs = await OpenAIService.instance.generateWordPairs(
          category: widget.category,
          count: 3,
        );
      } else {
        newPairs = await GeminiService.instance.generateWordPairs(
          category: widget.category,
          count: 3,
        );
      }
      
      // Add to the global data store
      WordPairsData.addGeneratedPairs(newPairs);
      
      // Refresh our local list
      setState(() {
        _pairs.addAll(newPairs);
        _isGenerating = false;
      });
      
      _showMessage('✨ Added ${newPairs.length} new word pairs!');
      
      // 60 second cooldown to respect Gemini free tier limits (15 requests/minute)
      // This ensures we stay within the rate limit for testing/demo purposes
      _startCooldown(60);
      
    } catch (e) {
      setState(() {
        _isGenerating = false;
      });
      
      final errorMessage = e.toString().split(':').last.trim();
      
      // Provide helpful message for rate limit errors
      if (errorMessage.contains('Rate limit') || errorMessage.contains('429')) {
        _showMessage('⏱️ Rate limit reached. Please wait 60 seconds. Consider using OpenAI for unlimited access!');
        _startCooldown(60);
      } else {
        _showMessage(errorMessage);
      }
    }
  }

  void _startCooldown(int seconds) {
    setState(() {
      _cooldownSeconds = seconds;
    });
    
    _cooldownTimer?.cancel();
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      
      setState(() {
        if (_cooldownSeconds > 0) {
          _cooldownSeconds--;
        } else {
          _cooldownTimer?.cancel();
        }
      });
    });
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontSize: 16)),
        backgroundColor: AppTheme.darkText,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _startListening() async {
    setState(() {
      _isListening = true;
    });
    await _sttService.startListening();
  }

  void _stopListening() async {
    await _sttService.stopListening();
    setState(() {
      _isListening = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isComplete) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: AppTheme.mainBackgroundGradient,
              ),
              child: Column(
                children: [
                  // Navigation Bar with Generate Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildNavButton(
                          icon: Icons.arrow_back_rounded,
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          widget.category,
                          style: AppTheme.titleStyle,
                        ),
                        _buildGenerateButton(),
                      ],
                    ),
                  ),

                  // Progress Bar (Cleaner)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: ProgressBarWidget(
                      current: _currentPairIndex + 1,
                      total: _pairs.length,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Content Area
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Listen Button
                        ListenButton(onPressed: _playTargetWord),

                        const Spacer(flex: 1),

                        // Word Cards
                        // Word Cards
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: WordCard(
                                    word: _currentPair.word1,
                                    imageUrl: _currentPair.imageUrl1,
                                    isSelected: _selectedWordIndex == 0,
                                    isCorrect: _showFeedback && _targetWordIndex == 0,
                                    onTap: () => _onWordCardTapped(0),
                                    color: AppTheme.primaryBlue,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: WordCard(
                                    word: _currentPair.word2,
                                    imageUrl: _currentPair.imageUrl2,
                                    isSelected: _selectedWordIndex == 1,
                                    isCorrect: _showFeedback && _targetWordIndex == 1,
                                    onTap: () => _onWordCardTapped(1),
                                    color: AppTheme.accentPink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const Spacer(flex: 2),

                        // Record Button
                        RecordButton(
                          isListening: _isListening,
                          onStart: _startListening,
                          onStop: _stopListening,
                        ),
                        
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Feedback Overlay
            if (_showFeedback)
              FeedbackOverlay(
                isCorrect: _isCorrect,
                mouthHint: _mouthHint,
                onComplete: _onFeedbackComplete,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: AppTheme.glassDecoration,
        child: Icon(icon, color: AppTheme.darkText, size: 28),
      ),
    );
  }

  Widget _buildGenerateButton() {
    final isCoolingDown = _cooldownSeconds > 0;
    
    return GestureDetector(
      onTap: (_isGenerating || isCoolingDown) ? null : _generateMoreWords,
      child: Container(
        height: 52, // Match nav button height approximately
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isCoolingDown ? Colors.grey.shade300 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isCoolingDown ? null : AppTheme.cardShadow,
          border: isCoolingDown ? null : Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
        ),
        child: _isGenerating
            ? const SizedBox(
                width: 24,
                height: 24,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryBlue),
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isCoolingDown ? Icons.timer : Icons.auto_awesome, 
                    color: isCoolingDown ? Colors.grey : AppTheme.accentPurple, 
                    size: 22
                  ),
                  if (!isCoolingDown) ...[
                    const SizedBox(width: 8),
                    const Text(
                      'More',
                      style: TextStyle(
                        color: AppTheme.darkText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                  if (isCoolingDown) ...[
                     const SizedBox(width: 8),
                     Text(
                      '${_cooldownSeconds}s',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
