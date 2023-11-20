import 'package:flutter/material.dart';
import 'package:hr_app/src/views/create_holiday.dart';
import 'package:hr_app/src/views/holidays.dart';

class DesktopHoliday extends StatelessWidget {
  const DesktopHoliday({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: HolidayScreen()),
        Expanded(child: CreateHolidayScreen())
      ],
    );
  }
}
