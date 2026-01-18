import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../config/theme.dart';

class WordCard extends StatefulWidget {
  final String word;
  final String imageUrl;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;
  final Color? color;

  const WordCard({
    super.key,
    required this.word,
    required this.imageUrl,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
    this.color,
  });

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _borderColor {
    if (widget.isCorrect) return AppTheme.successGreen;
    if (widget.isSelected) return AppTheme.warningOrange;
    return Colors.transparent;
  }

  double get _borderWidth {
    if (widget.isCorrect || widget.isSelected) return 4.0;
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: _borderColor,
              width: _borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.isCorrect
                    ? AppTheme.successGreen.withValues(alpha: 0.3)
                    : Colors.black.withValues(alpha: 0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppTheme.primaryBlue.withValues(alpha: 0.1),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppTheme.accentPink.withValues(alpha: 0.1),
                        child: const Icon(
                          Icons.image_not_supported_outlined,
                          size: 48,
                          color: AppTheme.mediumText,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Word Label
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: widget.isCorrect
                        ? AppTheme.successGreen.withValues(alpha: 0.2)
                        : (widget.color?.withValues(alpha: 0.3) ?? AppTheme.secondaryYellow.withValues(alpha: 0.5)),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      widget.word,
                      style: AppTheme.wordStyle.copyWith(
                        color: widget.isCorrect
                            ? AppTheme.successGreen
                            : AppTheme.heavyText,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
