import 'package:flutter/material.dart';
import 'package:hr_app/src/features/calender/widgets/activity_list.dart';
import 'package:hr_app/src/features/calender/widgets/create_activity.dart';

class CalenderScreenDesktop extends StatelessWidget {
  const CalenderScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: ActivityList()),
        Expanded(child: CreateActivity())
      ],
    );
  }
}
