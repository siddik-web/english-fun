import 'package:flutter/material.dart';
import '../config/theme.dart';

class FeedbackOverlay extends StatefulWidget {
  final bool isCorrect;
  final String? mouthHint;
  final VoidCallback onComplete;

  const FeedbackOverlay({
    super.key,
    required this.isCorrect,
    this.mouthHint,
    required this.onComplete,
  });

  @override
  State<FeedbackOverlay> createState() => _FeedbackOverlayState();
}

class _FeedbackOverlayState extends State<FeedbackOverlay>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _fadeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeOut),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    _startAnimation();
  }

  void _startAnimation() async {
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    _scaleController.forward();
    
    if (widget.isCorrect) {
      _rotationController.forward();
      // Auto-dismiss after animation
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted) {
        widget.onComplete();
      }
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Container(
          color: Colors.black.withValues(alpha: 0.3 * _fadeAnimation.value),
          child: Center(
            child: widget.isCorrect
                ? _buildCorrectFeedback()
                : _buildIncorrectFeedback(),
          ),
        );
      },
    );
  }

  Widget _buildCorrectFeedback() {
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _rotationAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value * 0.5,
            child: child,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppTheme.successGreen.withValues(alpha: 0.4),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated star
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 100,
                  color: AppTheme.warningOrange.withValues(alpha: 0.3),
                ),
                const Icon(
                  Icons.star_rounded,
                  size: 80,
                  color: AppTheme.warningOrange,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '🎉 Great Job! 🎉',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.successGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncorrectFeedback() {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppTheme.warningOrange.withValues(alpha: 0.3),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.sentiment_satisfied_alt_rounded,
              size: 60,
              color: AppTheme.warningOrange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Try Again! 💪',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkText,
              ),
            ),
            if (widget.mouthHint != null) ...[
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.softYellow.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.tips_and_updates_rounded,
                      color: AppTheme.warningOrange,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        widget.mouthHint!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.darkText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.lightBlue,
                foregroundColor: AppTheme.darkText,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: widget.onComplete,
              child: const Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
