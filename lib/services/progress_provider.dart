import 'package:flutter/foundation.dart';

class ProgressProvider extends ChangeNotifier {
  final Map<String, int> _completedPairs = {};
  final Map<String, int> _totalPairs = {
    'Vowel Fun': 3,
    'Letter Sounds': 3,
    'Tricky Pairs': 3,
  };
  int _currentPairIndex = 0;
  int _correctAnswers = 0;
  int _totalAttempts = 0;

  int get currentPairIndex => _currentPairIndex;
  int get correctAnswers => _correctAnswers;
  int get totalAttempts => _totalAttempts;

  /// Get completed pairs for a category
  int getCompletedPairs(String category) {
    return _completedPairs[category] ?? 0;
  }

  /// Get total pairs for a category
  int getTotalPairs(String category) {
    return _totalPairs[category] ?? 0;
  }

  /// Get progress percentage for a category
  double getProgress(String category) {
    final completed = getCompletedPairs(category);
    final total = getTotalPairs(category);
    if (total == 0) return 0.0;
    return completed / total;
  }

  /// Mark a pair as completed
  void completePair(String category) {
    _completedPairs[category] = (getCompletedPairs(category) + 1);
    _currentPairIndex++;
    notifyListeners();
  }

  /// Record a correct answer
  void recordCorrectAnswer() {
    _correctAnswers++;
    _totalAttempts++;
    notifyListeners();
  }

  /// Record an incorrect answer
  void recordIncorrectAnswer() {
    _totalAttempts++;
    notifyListeners();
  }

  /// Reset progress for a category
  void resetCategory(String category) {
    _completedPairs[category] = 0;
    _currentPairIndex = 0;
    notifyListeners();
  }

  /// Reset all progress
  void resetAll() {
    _completedPairs.clear();
    _currentPairIndex = 0;
    _correctAnswers = 0;
    _totalAttempts = 0;
    notifyListeners();
  }

  /// Check if category is complete
  bool isCategoryComplete(String category) {
    return getCompletedPairs(category) >= getTotalPairs(category);
  }

  /// Get overall progress percentage
  double get overallProgress {
    int totalCompleted = 0;
    int totalPairs = 0;
    
    for (final category in _totalPairs.keys) {
      totalCompleted += getCompletedPairs(category);
      totalPairs += getTotalPairs(category);
    }
    
    if (totalPairs == 0) return 0.0;
    return totalCompleted / totalPairs;
  }
}
