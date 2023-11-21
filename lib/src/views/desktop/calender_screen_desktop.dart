import 'package:flutter/material.dart';
import 'package:hr_app/src/views/calender.dart';
import 'package:hr_app/src/views/create_activity.dart';

class CalenderScreenDesktop extends StatelessWidget {
  const CalenderScreenDesktop({super.key});

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
