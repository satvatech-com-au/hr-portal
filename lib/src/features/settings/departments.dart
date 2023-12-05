import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

bool isShowingEditMode = false;

class Departments extends StatefulWidget {
  const Departments({super.key});

  @override
  State<Departments> createState() => _DepartmentsState();
}

class _DepartmentsState extends State<Departments> {
  bool _showAddPositon = false;
  bool _showSetDepartment = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(
                flex: 4,
              ),
              const SizedBox(
                height: 50,
                width: 340,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by department',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showSetDepartment = true;
                  });
                },
                child: const Text('Set department'),
              ),
              const Gap(12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showAddPositon = true;
                  });
                },
                child: const Text('Add position'),
              ),
            ],
          ),
          const Gap(32),
          Stack(clipBehavior: Clip.none, children: [
            Card(
              child: DataTable(
                headingRowColor:
                    MaterialStateProperty.all(Colors.blue.shade100),
                border: TableBorder.symmetric(),
                columns: const [
                  DataColumn(
                    label: Text(
                      'S/N',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Position',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Department',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Actions',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  staffList.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text((index + 1).toString())),
                      DataCell(Text(staffList[index].position)),
                      DataCell(Text(staffList[index].department)),
                      DataCell(Text(staffList[index].status)),
                      DataCell(Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.view_carousel,
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
                              ))
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
            if (_showAddPositon)
              Positioned(
                  top: 60,
                  left: 150,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showAddPositon = false;
                                });
                              },
                              icon: const Icon(Icons.close)),
                        ),
                        const Text('Add Position'),
                        const Gap(20),
                        const SizedBox(
                          height: 40,
                          width: 340,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Position name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        const SizedBox(
                          height: 40,
                          width: 340,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Department',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Save'))
                      ],
                    ),
                  )),
            if (_showSetDepartment)
              Positioned(
                  top: 60,
                  left: 150,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showSetDepartment = false;
                                });
                              },
                              icon: const Icon(Icons.close)),
                        ),
                        const Text('Set Department'),
                        const Gap(20),
                        const SizedBox(
                          height: 40,
                          width: 340,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Department name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        ElevatedButton(
                            onPressed: () {}, child: const Text('Save'))
                      ],
                    ),
                  ))
          ]),
        ],
      ),
    ));
  }
}

class Staff {
  String position;
  String department;
  String status;
  String autoGeneratedPassword;
  Staff({
    required this.position,
    required this.department,
    required this.status,
    required this.autoGeneratedPassword,
  });
}

final List<Staff> staffList = [
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
  Staff(
      position: 'Mobile developer',
      department: 'Human Resource',
      status: 'Active',
      autoGeneratedPassword: 'frb535y467utht'),
];
