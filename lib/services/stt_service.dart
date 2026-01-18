import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class STTService {
  final SpeechToText _speechToText = SpeechToText();
  bool _isInitialized = false;
  bool _isListening = false;
  
  final StreamController<String> _recognizedWordsController = 
      StreamController<String>.broadcast();
  final StreamController<String> _statusController = 
      StreamController<String>.broadcast();

  Stream<String> get recognizedWords => _recognizedWordsController.stream;
  Stream<String> get statusStream => _statusController.stream;
  bool get isListening => _isListening;

  Future<bool> initialize() async {
    if (_isInitialized) return true;
    
    _isInitialized = await _speechToText.initialize(
      onError: (error) {
        _isListening = false;
        _statusController.add('error');
      },
      onStatus: (status) {
        _statusController.add(status);
        if (status == 'done' || status == 'notListening') {
          _isListening = false;
        } else if (status == 'listening') {
          _isListening = true;
        }
      },
    );
    
    return _isInitialized;
  }

  /// Start listening for speech
  Future<void> startListening() async {
    if (!_isInitialized) {
      bool working = await initialize();
      if (!working) {
        _statusController.add('error');
        return;
      }
    }
    
    if (_isInitialized && !_isListening) {
      _isListening = true;
      await _speechToText.listen(
        onResult: (SpeechRecognitionResult result) {
          if (result.finalResult) {
            _recognizedWordsController.add(result.recognizedWords);
          }
        },
        listenFor: const Duration(seconds: 10),
        pauseFor: const Duration(seconds: 3),
        localeId: 'en_US',
      );
    }
  }

  /// Stop listening
  Future<void> stopListening() async {
    if (_isListening) {
      await _speechToText.stop();
      _isListening = false;
    }
  }

  /// Cancel listening
  Future<void> cancelListening() async {
    await _speechToText.cancel();
    _isListening = false;
  }

  /// Compare spoken word with target word (fuzzy matching)
  bool compareWords(String spoken, String target) {
    final spokenLower = spoken.toLowerCase().trim();
    final targetLower = target.toLowerCase().trim();
    
    // Exact match
    if (spokenLower == targetLower) return true;
    
    // Check if target is contained in spoken words
    if (spokenLower.contains(targetLower)) return true;
    
    // Simple fuzzy match - allow 1 character difference for short words
    if (targetLower.length <= 4) {
      return _levenshteinDistance(spokenLower, targetLower) <= 1;
    }
    
    // For longer words, allow 2 character difference
    return _levenshteinDistance(spokenLower, targetLower) <= 2;
  }

  /// Calculate Levenshtein distance between two strings
  int _levenshteinDistance(String s1, String s2) {
    final m = s1.length;
    final n = s2.length;
    
    final d = List.generate(m + 1, (i) => List.generate(n + 1, (j) => 0));
    
    for (var i = 0; i <= m; i++) {
      d[i][0] = i;
    }
    for (var j = 0; j <= n; j++) {
      d[0][j] = j;
    }
    
    for (var j = 1; j <= n; j++) {
      for (var i = 1; i <= m; i++) {
        if (s1[i - 1] == s2[j - 1]) {
          d[i][j] = d[i - 1][j - 1];
        } else {
          d[i][j] = [
            d[i - 1][j] + 1,
            d[i][j - 1] + 1,
            d[i - 1][j - 1] + 1,
          ].reduce((a, b) => a < b ? a : b);
        }
      }
    }
    
    return d[m][n];
  }

  void dispose() {
    _speechToText.stop();
    _recognizedWordsController.close();
    _statusController.close();
  }
}
