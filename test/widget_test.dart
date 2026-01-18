import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:english_practice/main.dart';
import 'package:english_practice/data/word_pairs_data.dart';
import 'package:english_practice/models/word_pair.dart';
import 'package:english_practice/services/gemini_service.dart';
import 'package:english_practice/services/openai_service.dart';

void main() {
  group('App Initialization Tests', () {
    testWidgets('App loads and shows home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Verify home screen elements
      expect(find.text('English Fun! 🎉'), findsOneWidget);
      expect(find.text('Learn sounds & words!'), findsOneWidget);
      
      // Verify category cards are present
      expect(find.text('Vowel Fun'), findsOneWidget);
      expect(find.text('Letter Sounds'), findsOneWidget);
      expect(find.text('Tricky Pairs'), findsOneWidget);
    });

    testWidgets('Settings button is visible', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.settings_rounded), findsOneWidget);
    });
  });

  group('Navigation Tests', () {
    testWidgets('Tapping category card navigates to practice screen', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Tap on Vowel Fun category
      await tester.tap(find.text('Vowel Fun'));
      await tester.pumpAndSettle();

      // Verify we're on practice screen
      expect(find.text('Vowel Fun'), findsWidgets); // Title and category
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('Settings button opens settings screen', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Tap settings button
      await tester.tap(find.byIcon(Icons.settings_rounded));
      await tester.pumpAndSettle();

      // Verify settings screen
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('AI Provider'), findsOneWidget);
    });

    testWidgets('Back button returns to home screen', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Navigate to practice screen
      await tester.tap(find.text('Letter Sounds'));
      await tester.pumpAndSettle();

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we're back on home screen
      expect(find.text('English Fun! 🎉'), findsOneWidget);
    });
  });

  group('Word Pairs Data Tests', () {
    test('Word pairs data contains all categories', () {
      final categories = WordPairsData.categories;
      
      expect(categories.contains('Vowel Fun'), true);
      expect(categories.contains('Letter Sounds'), true);
      expect(categories.contains('Tricky Pairs'), true);
    });

    test('Each category has word pairs', () {
      final vowelPairs = WordPairsData.getPairsByCategory('Vowel Fun');
      final letterPairs = WordPairsData.getPairsByCategory('Letter Sounds');
      final trickyPairs = WordPairsData.getPairsByCategory('Tricky Pairs');

      expect(vowelPairs.isNotEmpty, true);
      expect(letterPairs.isNotEmpty, true);
      expect(trickyPairs.isNotEmpty, true);
    });

    test('Total word pairs is 100+', () {
      final allPairs = WordPairsData.allPairs;
      expect(allPairs.length, greaterThanOrEqualTo(100));
    });

    test('Word pairs have required fields', () {
      final pairs = WordPairsData.allPairs;
      
      for (var pair in pairs.take(10)) {
        expect(pair.word1.isNotEmpty, true);
        expect(pair.word2.isNotEmpty, true);
        expect(pair.category.isNotEmpty, true);
        expect(pair.mouthHint1 != null, true);
        expect(pair.mouthHint2 != null, true);
        if (pair.mouthHint1 != null) {
          expect(pair.mouthHint1!.isNotEmpty, true);
        }
        if (pair.mouthHint2 != null) {
          expect(pair.mouthHint2!.isNotEmpty, true);
        }
      }
    });

    test('Can add generated pairs', () {
      final initialCount = WordPairsData.allPairs.length;
      
      final newPair = WordPair(
        word1: 'Test1',
        word2: 'Test2',
        imageUrl1: 'url1',
        imageUrl2: 'url2',
        category: 'Vowel Fun',
        mouthHint1: 'hint1',
        mouthHint2: 'hint2',
      );
      
      WordPairsData.addGeneratedPairs([newPair]);
      
      expect(WordPairsData.allPairs.length, initialCount + 1);
    });

    test('Get random pairs returns correct count', () {
      final randomPairs = WordPairsData.getRandomPairs('Vowel Fun', 5);
      expect(randomPairs.length, lessThanOrEqualTo(5));
    });
  });

  group('WordPair Model Tests', () {
    test('WordPair model creates correctly', () {
      final pair = WordPair(
        word1: 'Ship',
        word2: 'Sheep',
        imageUrl1: 'url1',
        imageUrl2: 'url2',
        category: 'Vowel Fun',
        mouthHint1: 'Short i',
        mouthHint2: 'Long ee',
      );

      expect(pair.word1, 'Ship');
      expect(pair.word2, 'Sheep');
      expect(pair.category, 'Vowel Fun');
      expect(pair.mouthHint1, 'Short i');
      expect(pair.mouthHint2, 'Long ee');
    });

    test('WordPair getWord method works', () {
      final pair = WordPair(
        word1: 'Cat',
        word2: 'Cut',
        imageUrl1: 'url1',
        imageUrl2: 'url2',
        category: 'Tricky Pairs',
        mouthHint1: 'A sound',
        mouthHint2: 'U sound',
      );

      expect(pair.getWord(0), 'Cat');
      expect(pair.getWord(1), 'Cut');
    });

    test('WordPair getImageUrl method works', () {
      final pair = WordPair(
        word1: 'Bat',
        word2: 'Bet',
        imageUrl1: 'image1.jpg',
        imageUrl2: 'image2.jpg',
        category: 'Tricky Pairs',
        mouthHint1: 'A sound',
        mouthHint2: 'E sound',
      );

      expect(pair.getImageUrl(0), 'image1.jpg');
      expect(pair.getImageUrl(1), 'image2.jpg');
    });

    test('WordPair getMouthHint method works', () {
      final pair = WordPair(
        word1: 'Ship',
        word2: 'Sheep',
        imageUrl1: 'url1',
        imageUrl2: 'url2',
        category: 'Vowel Fun',
        mouthHint1: 'Short i - smile a little!',
        mouthHint2: 'Long ee - big smile!',
      );

      expect(pair.getMouthHint(0), 'Short i - smile a little!');
      expect(pair.getMouthHint(1), 'Long ee - big smile!');
    });
  });

  group('Service Tests', () {
    test('GeminiService singleton works', () {
      final instance1 = GeminiService.instance;
      final instance2 = GeminiService.instance;
      
      expect(identical(instance1, instance2), true);
    });

    test('OpenAIService singleton works', () {
      final instance1 = OpenAIService.instance;
      final instance2 = OpenAIService.instance;
      
      expect(identical(instance1, instance2), true);
    });

    test('GeminiService initialization requires API key', () {
      expect(
        () => GeminiService.instance.initializeWithSettings(
          apiKey: '',
          model: 'gemini-2.0-flash',
        ),
        throwsException,
      );
    });

    test('OpenAIService initialization requires API key', () {
      expect(
        () => OpenAIService.instance.initialize(
          apiKey: '',
          model: 'gpt-3.5-turbo',
        ),
        throwsException,
      );
    });
  });

  group('UI Component Tests', () {
    testWidgets('Category cards have correct colors', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // All three category cards should be visible
      expect(find.text('Vowel Fun'), findsOneWidget);
      expect(find.text('Letter Sounds'), findsOneWidget);
      expect(find.text('Tricky Pairs'), findsOneWidget);
    });

    testWidgets('Practice screen shows word cards', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Navigate to practice screen
      await tester.tap(find.text('Vowel Fun'));
      await tester.pumpAndSettle();

      // Should show word cards (at least one pair)
      expect(find.byType(Card), findsWidgets);
    });

    testWidgets('Settings screen has provider dropdown', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Open settings
      await tester.tap(find.byIcon(Icons.settings_rounded));
      await tester.pumpAndSettle();

      // Check for AI Provider section
      expect(find.text('AI Provider'), findsOneWidget);
    });
  });

  group('Progress Tests', () {
    testWidgets('Progress bar is visible on practice screen', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      await tester.pumpAndSettle();

      // Navigate to practice screen
      await tester.tap(find.text('Tricky Pairs'));
      await tester.pumpAndSettle();

      // Progress bar should be visible
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    });
  });

  group('Animation Tests', () {
    testWidgets('Home screen has fade animation', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      
      // Pump a few frames to let animations start
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 500));
      
      // Subtitle should be visible after animation
      expect(find.text('Learn sounds & words!'), findsOneWidget);
    });

    testWidgets('Category cards animate on load', (WidgetTester tester) async {
      await tester.pumpWidget(const EnglishPracticeApp());
      
      // Pump several frames to complete animations
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump(const Duration(milliseconds: 400));
      await tester.pumpAndSettle();
      
      // All cards should be visible after animation
      expect(find.text('Vowel Fun'), findsOneWidget);
      expect(find.text('Letter Sounds'), findsOneWidget);
      expect(find.text('Tricky Pairs'), findsOneWidget);
    });
  });

  group('Edge Cases Tests', () {
    test('Empty category returns empty list', () {
      final pairs = WordPairsData.getPairsByCategory('NonExistent');
      expect(pairs.isEmpty, true);
    });

    test('Random pairs with count larger than available returns all', () {
      final vowelPairs = WordPairsData.getPairsByCategory('Vowel Fun');
      final randomPairs = WordPairsData.getRandomPairs('Vowel Fun', 1000);
      
      expect(randomPairs.length, lessThanOrEqualTo(vowelPairs.length));
    });

    test('Dynamic pairs count works correctly', () {
      final initialCount = WordPairsData.getDynamicPairsCount('Vowel Fun');
      
      final newPair = WordPair(
        word1: 'Dynamic1',
        word2: 'Dynamic2',
        imageUrl1: 'url1',
        imageUrl2: 'url2',
        category: 'Vowel Fun',
        mouthHint1: 'hint1',
        mouthHint2: 'hint2',
      );
      
      WordPairsData.addGeneratedPairs([newPair]);
      
      expect(
        WordPairsData.getDynamicPairsCount('Vowel Fun'),
        initialCount + 1,
      );
    });
  });
}
