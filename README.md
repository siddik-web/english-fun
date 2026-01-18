# English Practice App 🎉

A Flutter mobile application designed for Grade 1 students to practice English pronunciation through minimal pairs exercises.

## Features

### 🎯 Three Practice Categories
- **Vowel Fun** - Practice short vs long vowel sounds (i/ee, a/a, o/o, u/u)
- **Letter Sounds** - Learn consonant distinctions (F/V, P/B, T/D, S/Z, K/G, L/R, etc.)
- **Tricky Pairs** - Master challenging minimal pairs (A/E, I/E, O/U, consonant endings)

### 🖼️ Reliable Visuals
- **Dynamic Images**: All words feature consistent, reliable visual aids
- **Offline Capable**: Text-based generation ensures no broken links
- **Clear Text**: Large, readable text on every image card

### 🤖 AI-Powered Word Generation
- **Dual AI Support**: Choose between OpenAI (GPT-3.5/4) or Google Gemini
- **Smart Generation**: AI creates contextual minimal pairs on-demand
- **Rate Limit Handling**: 60-second cooldown for free tier compatibility

### 🎨 Modern UI/UX
- **Vibrant Design**: Modern color palette with excellent contrast
- **Smooth Animations**: Polished transitions and micro-interactions
- **Kid-Friendly**: Large buttons, clear text, engaging visuals
- **Accessibility**: WCAG AA compliant contrast ratios

### 🔊 Audio Features
- **Text-to-Speech**: Native pronunciation for all words
- **Speech Recognition**: Record your voice and master pronunciation with instant AI feedback! 🎙️
- **Audio Hints**: Mouth position guidance for each sound

### 🏆 Gamification
- **Stars & Levels**: Earn stars for every correct pair mastered
- **Daily Streaks**: Build your learning habit with daily streak tracking
- **Achievements**: Unlock colorful badges and trophies as you progress 🏆
- **Trophy Room**: View all your earned achievements from the home screen

### 💾 Offline Support
- **AI Word Caching**: All AI-generated words are saved locally for offline practice
- **Hybrid Content**: Seamlessly mixes static word pairs with your personal AI history
- **Cache Management**: Easily clear offline content in app settings

### 📊 Progress Tracking
- **Visual Progress**: Track completion across categories
- **Score System**: Earn points for correct answers
- **Persistent Data**: Progress saved locally using CacheService

## Getting Started

### Prerequisites
- Flutter SDK 3.38.7 or higher
- Android Studio / VS Code
- Android device or emulator
- **Microphone Permission**: Required for speech practice

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd english-practice
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure AI Provider** (Optional)
   
   Create a `.env` file in the root directory:
   ```env
   GEMINI_API_KEY=your_gemini_key_here
   OPENAI_API_KEY=your_openai_key_here
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

5. **Build APK**
   ```bash
   flutter build apk --release
   ```

## Configuration

### AI Provider Setup

#### Option 1: OpenAI (Recommended)
1. Get API key from [OpenAI Platform](https://platform.openai.com/api-keys)
2. Open Settings in app
3. Select "OpenAI (Recommended)"
4. Enter your API key (starts with `sk-`)
5. Choose model: GPT-3.5 Turbo (fastest/cheapest) or GPT-4

**Cost**: ~$0.05 per 100 word pairs (very affordable)

#### Option 2: Google Gemini (Free Tier)
1. Get API key from [Google AI Studio](https://aistudio.google.com/app/apikey)
2. Open Settings in app
3. Select "Gemini"
4. Enter your API key
5. Choose model: Gemini 2.0 Flash or 2.5 Flash

**Limits**: 15 requests/minute, 1,500/day (60-second cooldown enforced)

## Project Structure

```
lib/
├── config/
│   └── theme.dart              # App theme and colors
├── data/
│   └── word_pairs_data.dart    # 300+ static word pairs
├── models/
│   ├── word_pair.dart          # WordPair data model
│   └── achievement.dart        # Gamification model
├── screens/
│   ├── home_screen.dart        # Main category selection
│   ├── practice_screen.dart    # Practice exercises
│   └── settings_screen.dart    # AI and app settings
├── services/
│   ├── gemini_service.dart     # Google Gemini integration
│   ├── openai_service.dart     # OpenAI integration
│   ├── cache_service.dart      # Offline persistence
│   ├── gamification_service.dart # Stars, streaks, and badges
│   ├── tts_service.dart        # Text-to-speech
│   ├── stt_service.dart        # Speech-to-text integration
│   └── progress_provider.dart  # Progress tracking
├── widgets/
│   ├── category_card.dart      # Category selection cards
│   ├── word_card.dart          # Word display cards
│   ├── achievement_overlay.dart # Animated unlock notifications
│   ├── record_button.dart      # Voice recording button
│   ├── listen_button.dart      # Audio playback button
│   ├── feedback_overlay.dart   # Answer feedback
│   └── progress_bar.dart       # Progress indicator
└── main.dart                   # App entry point

test/
└── widget_test.dart            # 30+ comprehensive tests
```

## Testing

Run all tests:
```bash
flutter test
```

**Test Coverage**:
- ✅ App initialization
- ✅ Navigation flows
- ✅ Word pairs data (300+ pairs)
- ✅ WordPair model methods
- ✅ Service singletons
- ✅ Edge cases

## Word Pairs Content

The app includes **300+ carefully curated minimal pairs** (600+ words):

- **100+ Vowel Fun pairs**: Short/long vowels across all vowel sounds
- **100+ Letter Sounds pairs**: Consonant distinctions (voiced/unvoiced, similar sounds)
- **100+ Tricky Pairs**: Advanced challenges (mixed vowels, consonant endings, double letters)

## Technologies Used

- **Framework**: Flutter 3.38.7
- **Language**: Dart
- **AI APIs**: OpenAI GPT, Google Gemini
- **State Management**: Provider
- **Storage**: SharedPreferences
- **Audio**: flutter_tts, speech_to_text
- **Environment**: flutter_dotenv

## Key Features Implementation

### Color Scheme
- Modern, accessible palette with WCAG AA compliance
- Primary: Blue (#2196F3) - Navigation and branding
- Secondary: Orange (#FF9800) - CTAs and highlights
- Neutrals: Grays for text hierarchy
- Semantic: Green (success), Red (error), Amber (warning)

### Animations
- Delayed start with `addPostFrameCallback` to prevent layout errors
- Staggered card animations for engaging load experience
- Smooth transitions between screens

### Rate Limit Handling
- 60-second cooldown between generations
- Clear countdown timer display
- Helpful error messages with upgrade suggestions

## Known Issues & Limitations

- **Gemini Free Tier**: Very restrictive (15 RPM, 1,500/day) - use OpenAI for production
- **Speech Recognition**: Performance varies by device microphone quality

## Future Enhancements

- [ ] Parent/teacher dashboard
- [ ] Multi-language support
- [ ] Dark mode
- [ ] Tablet optimization

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Minimal pairs methodology from linguistics research
- placehold.co for reliable placeholder images
- OpenAI and Google for AI APIs
- Flutter team for the amazing framework

## Support

For issues, questions, or suggestions, please open an issue on GitHub.

---

**Made with ❤️ for young English learners**
