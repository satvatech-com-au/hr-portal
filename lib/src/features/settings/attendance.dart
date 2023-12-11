import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hr_app/src/models/geo_fencing_area.dart';

class AttendanceSettingsScreen extends StatefulWidget {
  const AttendanceSettingsScreen({super.key});

  @override
  State<AttendanceSettingsScreen> createState() =>
      _AttendanceSettingsScreenState();
}

class _AttendanceSettingsScreenState extends State<AttendanceSettingsScreen> {
  TimeOfDay? _selectedStartTime;
  final TextEditingController _startTimeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedStartTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedStartTime) {
      setState(() {
        _selectedStartTime = picked;
        _startTimeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              const Gap(30),
              const Divider(),
              const Gap(30),
              const Text('Attendance'),
              const SizedBox(
                height: 50,
                child: TabBar(
                  tabs: [
                    Tab(text: 'Work Shift'),
                    Tab(text: 'IPs Allowed'),
                    Tab(text: 'Geo-fencing Co-ordinates'),
                  ],
                ),
              ),
              const Gap(20),
              SizedBox(
                height: 400,
                child: TabBarView(children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(child: Text('Work shift name')),
                          const Gap(15),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 350,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: _startTimeController,
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const Expanded(child: Text('Start time')),
                          const Gap(15),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 350,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: _startTimeController,
                                onTap: () => _selectTime(context),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const Expanded(child: Text('End time')),
                          const Gap(15),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 350,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: _startTimeController,
                                onTap: () => _selectTime(context),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          const Expanded(child: Text('Late time count')),
                          const Gap(15),
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: 350,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                controller: _startTimeController,
                                onTap: () => _selectTime(context),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),

                  // IP
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              controller: _startTimeController,
                            ),
                          ),
                          const Gap(20),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Add IP'),
                          )
                        ],
                      ),
                    ],
                  ),

                  const GeoTable(),
                ]),
              ),
            ],
          ),
        ));
  }
}

class GeoTable extends StatefulWidget {
  const GeoTable({super.key});

  @override
  State<GeoTable> createState() => _GeoTableState();
}

class _GeoTableState extends State<GeoTable> {
  @override
  Widget build(BuildContext context) {
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
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Point 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Point 2',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Point 3',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Point 4',
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
              areas.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(areas[index].name)),
                  DataCell(Text(areas[index].p1)),
                  DataCell(Text(areas[index].p2)),
                  DataCell(Text(areas[index].p2)),
                  DataCell(Text(areas[index].p2)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) =>
                              //       UserAccessDialog(
                              //     hrMember: areas[index],
                              //   ),
                              // );
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
                                              'Are sure you want to delete this leave type?'),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              const Spacer(),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 8,
                                                      horizontal: 16),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Text('Yes'),
                                                ),
                                              ),
                                              const Spacer(),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 16),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Text('No'))),
                                              const Spacer(),
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
