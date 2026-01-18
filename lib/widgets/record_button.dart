import 'package:flutter/material.dart';
import '../config/theme.dart';

class RecordButton extends StatefulWidget {
  final bool isListening;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const RecordButton({
    super.key,
    required this.isListening,
    required this.onStart,
    required this.onStop,
  });

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(RecordButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening && !oldWidget.isListening) {
      _pulseController.repeat(reverse: true);
    } else if (!widget.isListening && oldWidget.isListening) {
      _pulseController.stop();
      _pulseController.reset();
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) => widget.onStart(),
      onLongPressEnd: (_) => widget.onStop(),
      onTap: () {
        if (widget.isListening) {
          widget.onStop();
        } else {
          widget.onStart();
        }
      },
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Pulse ring (only when listening)
              if (widget.isListening)
                Transform.scale(
                  scale: _pulseAnimation.value,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.errorRed.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              // Main button
                  AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.isListening
                        ? [AppTheme.errorRed, AppTheme.errorRed.withValues(alpha: 0.7)]
                        : [AppTheme.accentPink, AppTheme.accentPink.withValues(alpha: 0.7)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: (widget.isListening 
                          ? AppTheme.errorRed 
                          : AppTheme.accentPink).withValues(alpha: 0.4),
                      blurRadius: widget.isListening ? 20 : 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.isListening ? Icons.mic : Icons.mic_none_rounded,
                      size: 40,
                      color: widget.isListening ? Colors.white : AppTheme.heavyText,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.isListening ? 'Stop' : 'Record',
                      style: AppTheme.subtitleStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.isListening ? Colors.white : AppTheme.heavyText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
