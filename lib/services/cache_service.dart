import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/word_pair.dart';

class CacheService {
  static final CacheService _instance = CacheService._internal();
  static CacheService get instance => _instance;

  late SharedPreferences _prefs;
  bool _isInitialized = false;

  CacheService._internal();

  /// Initialize the service
  Future<void> initialize() async {
    if (_isInitialized) return;
    _prefs = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  /// Initializer helper for synchronous access after main initialization
  static Future<void> ensureInitialized() async {
    await instance.initialize();
  }

  /// Get storage key for a category
  String _getKey(String category) => 'cached_pairs_$category';

  /// Save new pairs to cache (appending to existing ones)
  Future<void> savePairs(String category, List<WordPair> newPairs) async {
    if (!_isInitialized) await initialize();
    
    // Load existing pairs first
    final existingPairs = await loadPairs(category);
    
    // Combine lists
    final allPairs = [...existingPairs, ...newPairs];
    
    // Convert to JSON
    final jsonList = allPairs.map((pair) => pair.toJson()).toList();
    final jsonString = jsonEncode(jsonList);
    
    // Save string
    await _prefs.setString(_getKey(category), jsonString);
  }

  /// Load all cached pairs for a category
  Future<List<WordPair>> loadPairs(String category) async {
    if (!_isInitialized) await initialize();
    
    final jsonString = _prefs.getString(_getKey(category));
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => WordPair.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // If data is corrupted, return empty list
      return [];
    }
  }

  /// Clear all cached content
  Future<void> clearCache() async {
    if (!_isInitialized) await initialize();
    
    for (var category in PracticeCategory.values) {
      await _prefs.remove(_getKey(category.displayName));
    }
  }
}
