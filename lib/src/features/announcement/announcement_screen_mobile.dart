import 'package:flutter/material.dart';
import 'package:hr_app/src/features/announcement/widgets/announcements_list.dart';
import 'package:hr_app/src/features/announcement/widgets/create_annoucement.dart';

class AnnouncementScreenMobile extends StatelessWidget {
  const AnnouncementScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AnnouncementsLists(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CreateAnnouncement()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
