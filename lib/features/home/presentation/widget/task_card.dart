import 'package:axen_tech_assignment/features/home/presentation/widget/progress_bar.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    this.persons,
    this.progress,
    this.progressTotal,
  });

  final String title;
  final String description;
  final List<String>? persons;
  final double? progress;
  final double? progressTotal;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10.0),
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Spacer(),
          ProgressBar(
            progress: progress,
            progressTotal: progressTotal,
          ),
        ],
      ),
    );
  }
}
