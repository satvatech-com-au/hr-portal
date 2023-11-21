import 'package:flutter/material.dart';
import 'package:hr_app/src/views/create_employee.dart';
import 'package:hr_app/src/views/employees.dart';

class DesktopEmployees extends StatelessWidget {
  const DesktopEmployees({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: EmployeesScreen()),
        Expanded(child: CreateEmployeeScreen())
      ],
    );
  }
}
