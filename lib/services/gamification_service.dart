import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement.dart';

class GamificationService extends ChangeNotifier {
  static final GamificationService _instance = GamificationService._internal();
  static GamificationService get instance => _instance;

  late SharedPreferences _prefs;
  bool _isInitialized = false;

  int _totalStars = 0;
  int _currentStreak = 0;
  List<String> _unlockedAchievementIds = [];

  List<Achievement> _achievements = [
    Achievement(
      id: 'novice_reader',
      title: 'Novice Reader',
      description: 'Get 10 correct answers!',
      icon: Icons.menu_book_rounded,
      color: Colors.blue,
    ),
    Achievement(
      id: 'super_star',
      title: 'Super Star',
      description: 'Get 50 correct answers!',
      icon: Icons.star_rounded,
      color: Colors.orange,
    ),
    Achievement(
      id: 'on_fire',
      title: 'On Fire!',
      description: 'Get 5 correct answers in a row!',
      icon: Icons.local_fire_department_rounded,
      color: Colors.red,
    ),
    Achievement(
      id: 'vowel_pro',
      title: 'Vowel Pro',
      description: 'Complete a Vowel Fun session!',
      icon: Icons.sentiment_very_satisfied_rounded,
      color: Colors.purple,
    ),
  ];

  GamificationService._internal();

  int get totalStars => _totalStars;
  int get currentStreak => _currentStreak;
  List<Achievement> get achievements {
    return _achievements.map((a) {
      return a.copyWith(isUnlocked: _unlockedAchievementIds.contains(a.id));
    }).toList();
  }

  Future<void> initialize() async {
    if (_isInitialized) return;
    _prefs = await SharedPreferences.getInstance();
    _totalStars = _prefs.getInt('gamification_stars') ?? 0;
    _currentStreak = _prefs.getInt('gamification_streak') ?? 0;
    _unlockedAchievementIds = _prefs.getStringList('gamification_unlocked_ids') ?? [];
    _isInitialized = true;
    notifyListeners();
  }

  Future<Achievement?> addStar({bool correct = true}) async {
    if (!correct) {
      _currentStreak = 0;
      await _prefs.setInt('gamification_streak', _currentStreak);
      notifyListeners();
      return null;
    }

    _totalStars++;
    _currentStreak++;
    
    await _prefs.setInt('gamification_stars', _totalStars);
    await _prefs.setInt('gamification_streak', _currentStreak);

    return _checkUnlockables();
  }

  Future<Achievement?> _checkUnlockables() async {
    Achievement? newlyUnlocked;

    // Check for Novice Reader
    if (_totalStars >= 10 && !_isUnlocked('novice_reader')) {
      newlyUnlocked = await _unlock('novice_reader');
    }
    
    // Check for Super Star
    else if (_totalStars >= 50 && !_isUnlocked('super_star')) {
       newlyUnlocked = await _unlock('super_star');
    }

    // Check for On Fire
    else if (_currentStreak >= 5 && !_isUnlocked('on_fire')) {
      newlyUnlocked = await _unlock('on_fire');
    }

    notifyListeners();
    return newlyUnlocked;
  }
  
  // Method to check category completion achievement manually called from UI
  Future<Achievement?> checkCategoryCompletion(String category) async {
    if (category == 'Vowel Fun' && !_isUnlocked('vowel_pro')) {
      return await _unlock('vowel_pro');
    }
    return null;
  }

  bool _isUnlocked(String id) {
    return _unlockedAchievementIds.contains(id);
  }

  Future<Achievement?> _unlock(String id) async {
    if (_isUnlocked(id)) return null;
    
    _unlockedAchievementIds.add(id);
    await _prefs.setStringList('gamification_unlocked_ids', _unlockedAchievementIds);
    
    final achievement = _achievements.firstWhere((a) => a.id == id);
    return achievement; // Return so UI can show it
  }
}
