import 'package:flutter/material.dart';
import 'package:hr_app/src/views/calender.dart';
import 'package:hr_app/src/views/create_activity.dart';

class DesktopCalender extends StatelessWidget {
  const DesktopCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          Expanded(child: Calender()),
          Expanded(child: CreateActivityScreen())
        ],
      ),
    );
  }
}
