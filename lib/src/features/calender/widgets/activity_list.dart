import 'package:flutter/material.dart';
import 'package:hr_app/src/models/activity.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ListTile(
          leading: const Icon(
            Icons.notifications,
          ),
          title: Text(
            activity.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${activity.date} - ${activity.time}',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }
}
