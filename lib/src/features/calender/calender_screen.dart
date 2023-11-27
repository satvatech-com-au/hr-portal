import 'package:flutter/material.dart';
import 'package:hr_app/src/features/calender/calender_mobile.dart';
import 'package:hr_app/src/features/calender/calender_screen_desktop.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktopView: CalenderScreenDesktop(),
        mobileView: CalenderScreenMobile());
  }
}
