import 'package:flutter/material.dart';

bool isShowingEditMode = false;

class LeaveSetup extends StatefulWidget {
  const LeaveSetup({super.key});

  @override
  State<LeaveSetup> createState() => _LeaveSetupState();
}

class _LeaveSetupState extends State<LeaveSetup> {
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
                  'S/N',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Leave type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'Start date',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              DataColumn(
                label: Text(
                  'End date',
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
              leaves.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text((index + 1).toString())),
                  DataCell(Text(leaves[index].leavetype)),
                  DataCell(Text(leaves[index].startDate)),
                  DataCell(Text(leaves[index].endDate)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) =>
                              //       UserAccessDialog(
                              //     hrMember: leaves[index],
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Leave {
  String leavetype;
  String startDate;
  String endDate;

  Leave({
    required this.leavetype,
    required this.startDate,
    required this.endDate,
  });
}

final List<Leave> leaves = [
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
  Leave(
    leavetype: 'Anual leave',
    startDate: '03-12-2023',
    endDate: '03-02-2024',
  ),
];
