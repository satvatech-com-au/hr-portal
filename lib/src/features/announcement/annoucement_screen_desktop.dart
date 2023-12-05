import 'package:flutter/material.dart';
import 'package:hr_app/src/features/announcement/widgets/announcements_list.dart';
import 'package:hr_app/src/features/announcement/widgets/create_annoucement.dart';

class AnnouncementScreenDesktop extends StatelessWidget {
  const AnnouncementScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          Expanded(child: AnnouncementsLists()),
          Expanded(child: CreateAnnouncement()),
        ],
      ),
    );
  }
}
