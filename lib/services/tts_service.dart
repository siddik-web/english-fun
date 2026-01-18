import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts _flutterTts = FlutterTts();
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;
    
    await _flutterTts.setLanguage('en-US');
    await _flutterTts.setSpeechRate(0.4); // Slow for kids
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
    
    _isInitialized = true;
  }

  /// Speak a word with clear, slow pronunciation
  Future<void> speak(String word) async {
    await initialize();
    await _flutterTts.speak(word);
  }

  /// Speak with emphasis (slightly slower)
  Future<void> speakSlowly(String word) async {
    await initialize();
    await _flutterTts.setSpeechRate(0.3);
    await _flutterTts.speak(word);
    await _flutterTts.setSpeechRate(0.4); // Reset
  }

  /// Set speech rate (0.0 to 1.0)
  Future<void> setSpeed(double speed) async {
    await _flutterTts.setSpeechRate(speed);
  }

  /// Set language (e.g., 'en-US', 'en-GB')
  Future<void> setLanguage(String lang) async {
    await _flutterTts.setLanguage(lang);
  }

  /// Stop any ongoing speech
  Future<void> stop() async {
    await _flutterTts.stop();
  }

  void dispose() {
    _flutterTts.stop();
  }
}
