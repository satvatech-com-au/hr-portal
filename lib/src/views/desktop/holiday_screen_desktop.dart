import 'package:flutter/material.dart';
import 'package:hr_app/src/views/create_holiday.dart';
import 'package:hr_app/src/views/holidays.dart';

class HolidayScreenDesktop extends StatelessWidget {
  const HolidayScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: HolidayScreen()),
        Expanded(child: CreateHolidayScreen())
      ],
    );
  }
}
