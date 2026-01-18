class WordPair {
  final String word1;
  final String word2;
  final String imageUrl1;
  final String imageUrl2;
  final String category;
  final String? mouthHint1;
  final String? mouthHint2;

  const WordPair({
    required this.word1,
    required this.word2,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.category,
    this.mouthHint1,
    this.mouthHint2,
  });

  /// Get the word at index (0 or 1)
  String getWord(int index) => index == 0 ? word1 : word2;
  
  /// Get the image URL at index (0 or 1)
  String getImageUrl(int index) => index == 0 ? imageUrl1 : imageUrl2;
  
  /// Get the mouth hint at index (0 or 1)
  String? getMouthHint(int index) => index == 0 ? mouthHint1 : mouthHint2;
}

enum PracticeCategory {
  vowelFun('Vowel Fun'),
  letterSounds('Letter Sounds'),
  trickyPairs('Tricky Pairs');

  final String displayName;
  const PracticeCategory(this.displayName);
}
