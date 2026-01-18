import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/theme.dart';
import '../widgets/category_card.dart';
import '../services/gamification_service.dart';
import '../models/achievement.dart';
import 'practice_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
    ));

    // Delay animation start until after first frame to avoid layout errors
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.mainBackgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with Settings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildTrophyButton(context),
                    const SizedBox(width: 12),
                    _buildSettingsButton(context),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // App Title and Subtitle - Left Aligned
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'app-title',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          'English Fun! 🎉',
                          style: AppTheme.headingStyle.copyWith(
                            fontSize: 40,
                            shadows: [
                              BoxShadow(
                                color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'Learn sounds & words!',
                        style: AppTheme.subtitleStyle.copyWith(
                          fontSize: 20,
                          color: AppTheme.mediumText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 48),
              
              // Animated Category Cards
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildAnimatedCard(
                                index: 0,
                                child: CategoryCard(
                                  title: 'Vowel Fun',
                                  subtitle: 'Learn vowel sounds!',
                                  icon: Icons.music_note_rounded,
                                  color: AppTheme.primaryBlue,
                                  onTap: () => _navigateToPractice(context, 'Vowel Fun'),
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildAnimatedCard(
                                index: 1,
                                child: CategoryCard(
                                  title: 'Letter Sounds',
                                  subtitle: 'Practice consonants!',
                                  icon: Icons.volume_up_rounded,
                                  color: AppTheme.secondaryYellow,
                                  onTap: () => _navigateToPractice(context, 'Letter Sounds'),
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildAnimatedCard(
                                index: 2,
                                child: CategoryCard(
                                  title: 'Tricky Pairs',
                                  subtitle: 'Challenge mode!',
                                  icon: Icons.extension_rounded,
                                  color: AppTheme.accentPurple,
                                  onTap: () => _navigateToPractice(context, 'Tricky Pairs'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SettingsScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: AppTheme.glassDecoration,
        child: const Icon(
          Icons.settings_rounded,
          color: AppTheme.darkText,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildTrophyButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAchievementsDialog(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: AppTheme.glassDecoration,
        child: const Icon(
          Icons.emoji_events_rounded,
          color: Colors.amber,
          size: 28,
        ),
      ),
    );
  }

  void _showAchievementsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Row(
          children: [
            Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 32),
            SizedBox(width: 8),
            Text('Your Trophies', style: AppTheme.headingStyle),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Consumer<GamificationService>(
            builder: (context, gameService, _) {
              final achievements = gameService.achievements;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  final achievement = achievements[index];
                  return Opacity(
                    opacity: achievement.isUnlocked ? 1.0 : 0.5,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: achievement.isUnlocked 
                            ? achievement.color.withOpacity(0.1) 
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: achievement.isUnlocked 
                              ? achievement.color 
                              : Colors.grey.withOpacity(0.3),
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            achievement.isUnlocked ? achievement.icon : Icons.lock,
                            color: achievement.isUnlocked ? achievement.color : Colors.grey,
                            size: 32,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  achievement.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: achievement.isUnlocked ? AppTheme.darkText : Colors.grey,
                                  ),
                                ),
                                Text(
                                  achievement.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: achievement.isUnlocked ? AppTheme.mediumText : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard({required int index, required Widget child}) {
    // Staggered animation delay based on index
    final delay = Duration(milliseconds: 200 + (index * 150));
    
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: child,
          ),
        );
      },
      child: FutureBuilder(
        future: Future.delayed(delay),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return child;
          }
          return Opacity(opacity: 0, child: child);
        },
      ),
    );
  }

  void _navigateToPractice(BuildContext context, String category) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return PracticeScreen(category: category);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
