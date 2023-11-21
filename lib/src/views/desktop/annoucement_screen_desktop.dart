import 'package:flutter/material.dart';
import 'package:hr_app/src/views/announcement.dart';
import 'package:hr_app/src/views/create_annoucement.dart';

class DesktopAnnouncement extends StatelessWidget {
  const DesktopAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: AnnouncementScreen()),
        Expanded(child: CreateAnnouncementScreen())
      ],
    );
  }
}
