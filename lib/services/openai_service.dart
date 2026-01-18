import 'dart:convert';
import 'package:dart_openai/dart_openai.dart';
import '../models/word_pair.dart';

/// Service for generating word pairs using OpenAI's GPT models
class OpenAIService {
  static OpenAIService? _instance;
  String _currentModel = 'gpt-3.5-turbo';
  bool _isInitialized = false;
  
  OpenAIService._();
  
  static OpenAIService get instance {
    _instance ??= OpenAIService._();
    return _instance!;
  }
  
  /// Get the currently configured model name
  String get currentModel => _currentModel;
  
  /// Initialize the OpenAI service with API key
  void initialize({required String apiKey, String? model}) {
    if (apiKey.isEmpty) {
      throw Exception('Please enter your OpenAI API key');
    }
    
    OpenAI.apiKey = apiKey;
    if (model != null && model.isNotEmpty) {
      _currentModel = model;
    }
    _isInitialized = true;
  }
  
  /// Check if the service is properly initialized
  bool get isInitialized => _isInitialized;
  
  /// Generate new word pairs for a given category
  Future<List<WordPair>> generateWordPairs({
    required String category,
    int count = 3,
  }) async {
    if (!_isInitialized) {
      throw Exception('OpenAIService not initialized. Call initialize() first.');
    }
    
    final prompt = _buildPrompt(category, count);
    
    int retries = 0;
    const maxRetries = 3;
    
    while (true) {
      try {
        final chatCompletion = await OpenAI.instance.chat.create(
          model: _currentModel,
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
              role: OpenAIChatMessageRole.user,
              content: [
                OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
              ],
            ),
          ],
          temperature: 0.7,
          maxTokens: 1000,
        );
        
        final text = chatCompletion.choices.first.message.content?.first.text;
        
        if (text == null || text.isEmpty) {
          throw Exception('Empty response from OpenAI API');
        }
        
        return _parseResponse(text, category);
      } catch (e) {
        final errorStr = e.toString().toLowerCase();
        
        // Check for rate limits or temporary server errors
        if (errorStr.contains('429') || 
            errorStr.contains('rate limit') || 
            errorStr.contains('quota') ||
            errorStr.contains('overloaded') ||
            errorStr.contains('503')) {
          
          if (retries >= maxRetries) {
             throw Exception('Rate limit reached (OpenAI API). Please wait a moment before trying again.');
          }
          
          retries++;
          // Exponential backoff: 2s, 4s, 8s
          final waitTime = Duration(seconds: 2 * (1 << (retries - 1)));
          await Future.delayed(waitTime);
          continue;
        }
        
        // Non-retriable error
        throw Exception('Failed to generate word pairs: $e');
      }
    }
  }
  
  /// Build the prompt based on category
  String _buildPrompt(String category, int count) {
    String focusDescription;
    String examples;
    
    switch (category) {
      case 'Vowel Fun':
        focusDescription = 'minimal pairs focusing on vowel sound differences (like short i vs long ee, short a vs long a)';
        examples = 'ship/sheep, sit/seat, hat/hate, tap/tape';
        break;
      case 'Letter Sounds':
        focusDescription = 'minimal pairs focusing on consonant sound differences (like f/v, p/b, t/d, s/z, k/g)';
        examples = 'fan/van, pat/bat, tip/dip, sip/zip';
        break;
      case 'Tricky Pairs':
        focusDescription = 'minimal pairs with tricky vowel distinctions that are commonly confused (like a/e, a/u, i/e)';
        examples = 'bat/bet, cap/cup, pin/pen, man/men';
        break;
      default:
        focusDescription = 'minimal pairs for pronunciation practice';
        examples = 'ship/sheep, fan/van, cap/cup';
    }
    
    return '''
Generate $count minimal pairs for Grade 1 English pronunciation practice.
Category: $category
Focus: $focusDescription
Examples of this type: $examples

IMPORTANT: Use only simple, common words that a 6-7 year old would know.

Return ONLY a valid JSON array with this exact structure (no markdown, no extra text):
[
  {
    "word1": "simple word 1",
    "word2": "simple word 2", 
    "mouthHint1": "short kid-friendly tip for pronouncing word1",
    "mouthHint2": "short kid-friendly tip for pronouncing word2"
  }
]

Rules:
- Words must be real English words
- Words should differ by only one sound (minimal pairs)
- Keep mouth hints to under 8 words and fun/encouraging
- Use words appropriate for young children
- Do NOT include any words from these examples: $examples
''';
  }
  
  /// Parse the JSON response into WordPair objects
  List<WordPair> _parseResponse(String text, String category) {
    // Clean up the response - remove markdown code blocks if present
    String cleanedText = text.trim();
    if (cleanedText.startsWith('```json')) {
      cleanedText = cleanedText.substring(7);
    } else if (cleanedText.startsWith('```')) {
      cleanedText = cleanedText.substring(3);
    }
    if (cleanedText.endsWith('```')) {
      cleanedText = cleanedText.substring(0, cleanedText.length - 3);
    }
    cleanedText = cleanedText.trim();
    
    try {
      final List<dynamic> jsonList = json.decode(cleanedText);
      
      return jsonList.map((item) {
        return WordPair(
          word1: _capitalize(item['word1'] ?? ''),
          word2: _capitalize(item['word2'] ?? ''),
          imageUrl1: _getPlaceholderImage(item['word1'] ?? ''),
          imageUrl2: _getPlaceholderImage(item['word2'] ?? ''),
          category: category,
          mouthHint1: item['mouthHint1'] ?? 'Say it slowly!',
          mouthHint2: item['mouthHint2'] ?? 'Say it slowly!',
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to parse OpenAI response: $e\nResponse was: $cleanedText');
    }
  }
  
  /// Capitalize the first letter of a word
  String _capitalize(String word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
  
  /// Get a placeholder image URL for a word
  String _getPlaceholderImage(String word) {
    final colors = ['FF6B6B', '4ECDC4', 'FFE66D', '95E1D3', 'F38181', 'AA96DA'];
    final colorIndex = word.hashCode.abs() % colors.length;
    return 'https://placehold.co/400x400/${colors[colorIndex]}/white?text=${Uri.encodeComponent(word)}';
  }
}
