import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, this.progress, this.progressTotal});
  final double? progress;
  final double? progressTotal;

  @override
  Widget build(BuildContext context) {
    final progressValue = progress ?? 0.0;
    final totalValue = progressTotal ?? 100.0;
    final currentValue = (progressValue * totalValue).round();

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress', style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(width: 4.0),
              Text(
                '$currentValue/${totalValue.round()}',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Container(
            width: 300,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progressValue,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
