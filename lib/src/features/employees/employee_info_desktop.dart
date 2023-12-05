import 'package:flutter/material.dart';
import 'package:hr_app/src/models/member.dart';
import 'package:hr_app/src/widgets/benefits.dart';
import 'package:hr_app/src/widgets/contact_info.dart';
import 'package:hr_app/src/widgets/employment_info.dart';
import 'package:hr_app/src/widgets/leaves.dart';
import 'package:hr_app/src/widgets/payroll.dart';

class EmployeeInfoDesktop extends StatelessWidget {
  final Member member;
  const EmployeeInfoDesktop({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee Information'),
        ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: EmploymentInfoTab(member: member)),
                Expanded(
                  child: ContactInfoTab(member: member),
                ),
                Expanded(
                  child: BenefitsTab(member: member),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PayrollTab(
                    member: member,
                  ),
                ),
                Expanded(
                  child: ContactInfoTab(member: member),
                ),
                Expanded(
                  child: LeavesTab(member: member),
                )
              ],
            ),
          ],
        ));
  }
}
