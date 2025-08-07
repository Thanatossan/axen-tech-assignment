import 'package:flutter/material.dart';

class TaskInProgressCard extends StatelessWidget {
  const TaskInProgressCard(
      {super.key,
      this.progressPercentage,
      this.title,
      this.subtitle,
      this.timeAgo});
  final double? progressPercentage;
  final String? title;
  final String? subtitle;
  final String? timeAgo;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Productivity Mobile App",
                  style: Theme.of(context).textTheme.bodySmall),
              Text("Create Detail Booking",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              Text("2 min ago", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                value: 0.5,
              ),
              Text('50%', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
