import 'package:flutter/material.dart';
import '../config/theme.dart';

class ProgressBarWidget extends StatelessWidget {
  final int current;
  final int total;

  const ProgressBarWidget({
    super.key,
    required this.current,
    required this.total,
  });

  double get _progress => total > 0 ? current / total : 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: AppTheme.subtitleStyle.copyWith(
                fontSize: 14,
                color: AppTheme.mediumText,
              ),
            ),
            Text(
              '$current / $total',
              style: AppTheme.titleStyle.copyWith(
                fontSize: 14,
                color: AppTheme.primaryBlue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: _progress,
            minHeight: 10,
            backgroundColor: AppTheme.bgBlue,
            valueColor: AlwaysStoppedAnimation<Color>(
              _progress >= 1.0 ? AppTheme.successGreen : AppTheme.secondaryYellow,
            ),
          ),
        ),
      ],
    );
  }
}
