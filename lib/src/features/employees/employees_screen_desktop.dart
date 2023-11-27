import 'package:flutter/material.dart';
import 'package:hr_app/src/features/employees/create_employee.dart';
import 'package:hr_app/src/features/employees/employees_mobile.dart';

class EmployeesScreenDesktop extends StatelessWidget {
  const EmployeesScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: EmployeesList()),
        Expanded(child: CreateEmployee())
      ],
    );
  }
}
