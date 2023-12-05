import 'package:flutter/material.dart';
import 'package:hr_app/src/features/settings/edit_user_access.dart';
import 'package:hr_app/src/models/hr.dart';

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
        child: Card(
      color: Colors.white,
      elevation: 3,
      child: SingleChildScrollView(
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.blue.shade100),
          border: TableBorder.symmetric(),
          columns: const [
            DataColumn(
              label: Text(
                'S/N',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Contact',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            DataColumn(
              label: Text(
                'Actions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
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
                            builder: (BuildContext context) =>
                                EditUserAccessDialog(
                              hrMember: hrList[index],
                            ),
                          );
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                          ),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.delete,
                            size: 18,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: SizedBox(
                                      height: 190,
                                      width: 190,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          children: [
                                            const Spacer(),
                                            const Text(
                                                'Are sure you want to send this user a reset password link?'),
                                            const Spacer(),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('Yes')),
                                                const Spacer(),
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text('No')),
                                                const Spacer(),
                                              ],
                                            ),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.password,
                            size: 18,
                          ),
                        ))
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
