import 'package:flutter/material.dart';
import 'package:hr_app/src/features/announcement/annoucement_screen_desktop.dart';
import 'package:hr_app/src/features/announcement/announcement_screen_mobile.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';

class AnnoucementScreen extends StatelessWidget {
  const AnnoucementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktopView: AnnouncementScreenDesktop(),
        mobileView: AnnouncementScreenMobile());
  }
}
