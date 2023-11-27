// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hr_app/src/features/employees/employee_info_mobile.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';
import 'package:hr_app/src/widgets/attendance.dart';
import 'package:hr_app/src/widgets/benefits.dart';
import 'package:hr_app/src/widgets/contact_info.dart';
import 'package:hr_app/src/widgets/employment_info.dart';
import 'package:hr_app/src/widgets/leaves.dart';
import 'package:hr_app/src/widgets/payroll.dart';

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
        desktopView: Scaffold(
          body: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 120,
                    ),
                    Text(
                      member.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  EmploymentInfoTab(member: member),
                  ContactInfoTab(member: member),
                  BenefitsTab(member: member),
                ],
              ),
              Row(
                children: [
                  PayrollTab(
                    member: member,
                  ),
                  AttendanceTab(
                    member: member,
                  ),
                  LeavesTab(member: member),
                ],
              ),
            ],
          ),
        ),
        mobileView: EmployeeInfoMobile(
          member: members[3],
        ));
  }
}
