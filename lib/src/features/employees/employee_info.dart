import 'package:flutter/material.dart';
import 'package:hr_app/src/features/employees/employee_info_desktop.dart';
import 'package:hr_app/src/features/employees/employee_info_mobile.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';

class EmployeeInfoScreen extends StatelessWidget {
  final int index;
  final Member member;
  const EmployeeInfoScreen({
    Key? key,
    required this.index,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        desktopView: EmployeeInfoDesktop(member: members[index]),
        mobileView: EmployeeInfoMobile(
          member: members[index],
        ));
  }
}
