import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/theme.dart';
import '../services/gemini_service.dart';
import '../services/openai_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _geminiApiKeyController = TextEditingController();
  final _openaiApiKeyController = TextEditingController();
  String _selectedProvider = 'openai'; // Default to OpenAI
  String _selectedGeminiModel = 'gemini-2.0-flash';
  String _selectedOpenAIModel = 'gpt-3.5-turbo';
  bool _isLoading = true;
  bool _obscureGeminiKey = true;
  bool _obscureOpenAIKey = true;

  // Available Gemini models
  static const List<Map<String, String>> _geminiModels = [
    {'id': 'gemini-2.0-flash', 'name': 'Gemini 2.0 Flash (Recommended)'},
    {'id': 'gemini-2.5-flash', 'name': 'Gemini 2.5 Flash (Latest)'},
    {'id': 'gemini-2.5-flash-lite', 'name': 'Gemini 2.5 Flash Lite (Fast)'},
    {'id': 'gemini-2.5-pro', 'name': 'Gemini 2.5 Pro (Powerful)'},
  ];

  // Available OpenAI models
  static const List<Map<String, String>> _openaiModels = [
    {'id': 'gpt-3.5-turbo', 'name': 'GPT-3.5 Turbo (Fast & Cheap)'},
    {'id': 'gpt-4', 'name': 'GPT-4 (More Accurate)'},
    {'id': 'gpt-4-turbo', 'name': 'GPT-4 Turbo (Latest)'},
  ];

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  @override
  void dispose() {
    _geminiApiKeyController.dispose();
    _openaiApiKeyController.dispose();
    super.dispose();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedProvider = prefs.getString('ai_provider') ?? 'openai';
      _geminiApiKeyController.text = prefs.getString('gemini_api_key') ?? '';
      _openaiApiKeyController.text = prefs.getString('openai_api_key') ?? '';
      _selectedGeminiModel = prefs.getString('gemini_model') ?? 'gemini-2.0-flash';
      _selectedOpenAIModel = prefs.getString('openai_model') ?? 'gpt-3.5-turbo';
      _isLoading = false;
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ai_provider', _selectedProvider);
    await prefs.setString('gemini_api_key', _geminiApiKeyController.text.trim());
    await prefs.setString('gemini_model', _selectedGeminiModel);
    await prefs.setString('openai_api_key', _openaiApiKeyController.text.trim());
    await prefs.setString('openai_model', _selectedOpenAIModel);
    
    // Reinitialize the selected service
    try {
      if (_selectedProvider == 'gemini') {
        GeminiService.instance.initializeWithSettings(
          apiKey: _geminiApiKeyController.text.trim(),
          model: _selectedGeminiModel,
        );
      } else {
        OpenAIService.instance.initialize(
          apiKey: _openaiApiKeyController.text.trim(),
          model: _selectedOpenAIModel,
        );
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Settings saved! Using ${_selectedProvider == 'gemini' ? 'Gemini' : 'OpenAI'}'),
            backgroundColor: AppTheme.successGreen,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('⚠️ ${e.toString().replaceAll('Exception: ', '')}'),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
           gradient: AppTheme.mainBackgroundGradient,
        ),
        child: SafeArea(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: AppTheme.glassDecoration,
                              child: const Icon(Icons.arrow_back_rounded,
                                  color: AppTheme.darkText, size: 28),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            '⚙️ Settings',
                            style: AppTheme.headingStyle,
                          ),
                        ],
                      ),
                    ),

                    // Settings Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AI Settings Card
                            _buildSettingsCard(
                              title: '🤖 AI Word Generator',
                              children: [
                                // Provider Selection
                                const Text(
                                  'AI Provider',
                                  style: AppTheme.subtitleStyle,
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedProvider,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'openai',
                                          child: Text('OpenAI (Recommended)', style: TextStyle(fontSize: 14)),
                                        ),
                                        DropdownMenuItem(
                                          value: 'gemini',
                                          child: Text('Google Gemini', style: TextStyle(fontSize: 14)),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        if (value != null) {
                                          setState(() {
                                            _selectedProvider = value;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // OpenAI Settings (conditional)
                                if (_selectedProvider == 'openai') ...[
                                  Text(
                                    'Get your API key from:',
                                    style: AppTheme.subtitleStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
                                    ),
                                    child: const SelectableText(
                                      'https://platform.openai.com/api-keys',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.darkText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'OpenAI API Key',
                                    style: AppTheme.subtitleStyle,
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: _openaiApiKeyController,
                                    obscureText: _obscureOpenAIKey,
                                    decoration: InputDecoration(
                                      hintText: 'sk-...',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureOpenAIKey
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: AppTheme.mediumText,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureOpenAIKey = !_obscureOpenAIKey;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'OpenAI Model',
                                    style: AppTheme.subtitleStyle,
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _selectedOpenAIModel,
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        items: _openaiModels.map((model) {
                                          return DropdownMenuItem<String>(
                                            value: model['id'],
                                            child: Text(
                                              model['name']!,
                                              style: const TextStyle(fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          if (value != null) {
                                            setState(() {
                                              _selectedOpenAIModel = value;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],

                                // Gemini Settings (conditional)
                                if (_selectedProvider == 'gemini') ...[
                                  Text(
                                    'Get your free API key from:',
                                    style: AppTheme.subtitleStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
                                    ),
                                    child: const SelectableText(
                                      'https://aistudio.google.com/apikey',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: AppTheme.darkText,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Gemini API Key',
                                    style: AppTheme.subtitleStyle,
                                  ),
                                  const SizedBox(height: 8),
                                  TextField(
                                    controller: _geminiApiKeyController,
                                    obscureText: _obscureGeminiKey,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your API key...',
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureGeminiKey
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: AppTheme.mediumText,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureGeminiKey = !_obscureGeminiKey;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'Gemini Model',
                                    style: AppTheme.subtitleStyle,
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: _selectedGeminiModel,
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        items: _geminiModels.map((model) {
                                          return DropdownMenuItem<String>(
                                            value: model['id'],
                                            child: Text(
                                              model['name']!,
                                              style: const TextStyle(fontSize: 14),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          if (value != null) {
                                            setState(() {
                                              _selectedGeminiModel = value;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            const SizedBox(height: 24),

                            // Save Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: AppTheme.primaryButtonStyle.copyWith(
                                   backgroundColor: WidgetStateProperty.all(AppTheme.successGreen),
                                   foregroundColor: WidgetStateProperty.all(Colors.white),
                                ),
                                onPressed: _saveSettings,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.save_rounded, size: 24),
                                    SizedBox(width: 8),
                                    Text(
                                      'Save Settings',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Status indicator
                            Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: GeminiService.instance.isInitialized
                                      ? AppTheme.successGreen.withValues(alpha: 0.2)
                                      : Colors.orange.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                     color: GeminiService.instance.isInitialized
                                      ? AppTheme.successGreen.withValues(alpha: 0.5)
                                      : Colors.orange.withValues(alpha: 0.5),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      GeminiService.instance.isInitialized
                                          ? Icons.check_circle
                                          : Icons.warning_rounded,
                                      color: GeminiService.instance.isInitialized
                                          ? AppTheme.successGreen
                                          : Colors.orange,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      GeminiService.instance.isInitialized
                                          ? 'AI Connected'
                                          : 'AI Not Configured',
                                      style: TextStyle(
                                        color: GeminiService.instance.isInitialized
                                            ? AppTheme.successGreen
                                            : Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: AppTheme.glassDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.titleStyle,
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
