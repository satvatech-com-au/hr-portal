import 'package:flutter/material.dart';
import 'package:hr_app/src/models/hr.dart';
import 'package:hr_app/src/views/desktop/edit_user_access.dart';

bool isShowingEditMode = false;

class SettingsScreenDesktop extends StatefulWidget {
  const SettingsScreenDesktop({super.key});

  @override
  State<SettingsScreenDesktop> createState() => _SettingsScreenDesktopState();
}

class _SettingsScreenDesktopState extends State<SettingsScreenDesktop> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
        child: DataTable(
      border: TableBorder.all(),
      columns: const [
        DataColumn(label: Text('S/N')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Contact')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Actions')),
      ],
      rows: List<DataRow>.generate(
        hrList.length,
        (index) => DataRow(
          cells: [
            DataCell(Text((index + 1).toString())),
            DataCell(Text(hrList[index].name)),
            DataCell(Text(hrList[index].contact)),
            DataCell(Text(hrList[index].email)),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => EditUserAccessDialog(
                          hrMember: hrList[index],
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                    ))
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
