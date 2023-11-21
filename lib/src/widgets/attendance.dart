import 'package:flutter/material.dart';
import 'package:hr_app/src/models/attendance.dart';
import 'package:hr_app/src/models/member.dart';

class AttendanceTab extends StatefulWidget {
  final Member member;
  const AttendanceTab({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListTile(
            title: const Text(
              'Attendance',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
                icon:
                    Icon(isCollapsed ? Icons.expand_more : Icons.expand_less)),
          ),
          if (!isCollapsed)
            DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('Serial Number')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Clock-In Time')),
                DataColumn(label: Text('Clock-Out Time')),
              ],
              rows: List<DataRow>.generate(
                attendance.length,
                (index) => DataRow(cells: [
                  DataCell(
                    Text(
                      '${index + 1}',
                    ),
                  ),
                  DataCell(
                    Text(
                        '${attendance[index].date.day}/${attendance[index].date.month}/${attendance[index].date.year}'),
                  ),
                  DataCell(
                    Text(
                      '${attendance[index].clockInTime.hour}:${attendance[index].clockInTime.minute}',
                    ),
                  ),
                  DataCell(
                    Text(
                        '${attendance[index].clockOutTime.hour}:${attendance[index].clockOutTime.minute}'),
                  ),
                ]),
              ),
            )
        ],
      ),
    );
  }
}
