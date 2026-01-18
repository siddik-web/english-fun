import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/theme.dart';
import 'screens/home_screen.dart';
import 'services/tts_service.dart';
import 'services/stt_service.dart';
import 'services/progress_provider.dart';
import 'services/gemini_service.dart';
import 'services/openai_service.dart';
import 'services/gamification_service.dart';
import 'services/cache_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Services
  await GamificationService.instance.initialize();
  await CacheService.instance.initialize();
  
  // Try to load saved settings first
  try {
    final prefs = await SharedPreferences.getInstance();
    final provider = prefs.getString('ai_provider') ?? 'openai';
    
    if (provider == 'openai') {
      final openaiKey = prefs.getString('openai_api_key');
      final openaiModel = prefs.getString('openai_model') ?? 'gpt-3.5-turbo';
      
      if (openaiKey != null && openaiKey.isNotEmpty) {
        OpenAIService.instance.initialize(
          apiKey: openaiKey,
          model: openaiModel,
        );
      }
    } else {
      final geminiKey = prefs.getString('gemini_api_key');
      final geminiModel = prefs.getString('gemini_model') ?? 'gemini-2.0-flash';
      
      if (geminiKey != null && geminiKey.isNotEmpty) {
        GeminiService.instance.initializeWithSettings(
          apiKey: geminiKey,
          model: geminiModel,
        );
      } else {
        // Fallback to .env file for Gemini
        await dotenv.load(fileName: '.env');
        GeminiService.instance.initialize();
      }
    }
  } catch (e) {
    // API key not configured - app will still work without AI generation
    debugPrint('AI service not configured: $e');
  }
  
  runApp(const EnglishPracticeApp());
}

class EnglishPracticeApp extends StatelessWidget {
  const EnglishPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressProvider()),
        ChangeNotifierProvider.value(value: GamificationService.instance),
        Provider(create: (_) => TTSService()),
        Provider(create: (_) => STTService()),
      ],
      child: MaterialApp(
        title: 'English Fun!',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppTheme.primaryBlue,
            brightness: Brightness.light,
            secondary: AppTheme.secondaryYellow,
          ),
          useMaterial3: true,
          fontFamily: 'Nunito',
          scaffoldBackgroundColor: AppTheme.bgBlue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: AppTheme.headingStyle,
            iconTheme: IconThemeData(color: AppTheme.darkText),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: AppTheme.primaryButtonStyle,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
