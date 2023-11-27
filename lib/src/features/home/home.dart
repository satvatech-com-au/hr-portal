// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr_app/src/features/announcement/widgets/create_annoucement.dart';
import 'package:hr_app/src/features/employees/create_employee.dart';
import 'package:hr_app/src/models/birthdays.dart';
import 'package:hr_app/src/models/notices.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';
import 'package:hr_app/src/widgets/option_card.dart';
import 'package:popover/popover.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    final day = now.weekday;

    // final time = "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
    final List<String> weekdays = [
      '',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    String getGreeting() {
      if (hour < 12) {
        return "Good morning";
      } else if (hour < 17) {
        return "Good afternoon";
      } else {
        return "Good evening";
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      getGreeting(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${weekdays[day]}, ${now.day}-${now.month}-${now.year}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        // Text(time, style: const TextStyle(fontSize: 22)),
                      ],
                    ),
                  ],
                ),
                if (MediaQuery.sizeOf(context).width > 550)
                  const SizedBox(
                    width: 300,
                    child: ListTile(
                      title: Text('Perigee Insights'),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: OptionCard(
                    text: 'Total employees',
                    figure: 23,
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: OptionCard(
                    figure: 11,
                    text: 'Total teams',
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: OptionCard(
                    figure: '\$4,450',
                    text: 'Total payroll',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Attendance',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    child: const Text('This week'),
                    onTap: () => showPopover(
                        direction: PopoverDirection.bottom,
                        width: 20,
                        height: 200,
                        context: context,
                        bodyBuilder: (context) => const MenuItems())),
              ],
            ),
            DataTable(
              columns: const [
                DataColumn(label: Text('Staff ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Time In')),
              ],
              rows: attendanceList
                  .map((data) => DataRow(
                        cells: [
                          DataCell(Text(
                              (Random().nextInt(84464) + 11000).toString())),
                          DataCell(Text(data.name)),
                          DataCell(Text(data.timeIn)),
                        ],
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            if (ResponsiveLayout.isDesktop(context))
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Upcoming Birthdays',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: upcomingBirthdays.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(upcomingBirthdays[index].name),
                                  Text(
                                      '${upcomingBirthdays[index].date.day.toString().padLeft(2, '0')}-${upcomingBirthdays[index].date.month.toString().padLeft(2, '0')}-${upcomingBirthdays[index].date.year}  '),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          'Notices',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: notices.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(notices[index].content),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            const Spacer(
              flex: 3,
            ),
            if (ResponsiveLayout.isMobile(context))
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const CreateEmployee())));
                      },
                      child: const Text('Create employee')),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CreateAnnouncement()));
                      },
                      child: const Text('Create announcement')),
                ],
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.red,
          child: const Text('Today'),
        ),
        Container(
          height: 50,
          color: Colors.red,
          child: const Text('Today'),
        ),
        Container(
          height: 50,
          color: Colors.red,
          child: const Text('Today'),
        ),
      ],
    );
  }
}

final List<AttendanceData> attendanceList = [
  AttendanceData(staffId: 1, name: 'John Doe', timeIn: '08:00 AM'),
  AttendanceData(staffId: 2, name: 'Jane Smith', timeIn: '08:15 AM'),
  AttendanceData(staffId: 1, name: 'John Doe', timeIn: '08:00 AM'),
  AttendanceData(staffId: 2, name: 'Jane Smith', timeIn: '08:15 AM'),
];

class AttendanceData {
  final int staffId;
  final String name;
  final String timeIn;

  AttendanceData(
      {required this.staffId, required this.name, required this.timeIn});
}
