import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AttendanceSettings extends StatefulWidget {
  const AttendanceSettings({super.key});

  @override
  State<AttendanceSettings> createState() => _AttendanceSettingsState();
}

class _AttendanceSettingsState extends State<AttendanceSettings> {
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

  bool showWorkShift = false;
  bool showIPs = false;
  bool showGeofencing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 60,
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Work Shift',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          showWorkShift = !showWorkShift;
                        });
                      },
                      icon: showWorkShift
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more))
                ],
              ),
            ),
          ),
          const Gap(15),
          if (showWorkShift)
            Column(
              children: [
                Row(
                  children: [
                    const Text('Work shift name'),
                    const Gap(15),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: _startTimeController,
                        onTap: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    const Text('Start time'),
                    const Gap(15),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: _startTimeController,
                        onTap: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    const Text('End time'),
                    const Gap(15),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: _startTimeController,
                        onTap: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Row(
                  children: [
                    const Text('Late count time'),
                    const Gap(15),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: _startTimeController,
                        onTap: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          const Gap(30),
          ElevatedButton(onPressed: () {}, child: const Text('Save')),
          const Gap(30),
          Container(
            height: 60,
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'IPs Allowed',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          showIPs = !showIPs;
                        });
                      },
                      icon: showIPs
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more))
                ],
              ),
            ),
          ),
          const Gap(30),
          if (showIPs)
            Row(
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    controller: _startTimeController,
                    // onTap: () => _selectTime(context),
                  ),
                ),
                const Gap(20),
                ElevatedButton(onPressed: () {}, child: const Text('Add IP'))
              ],
            ),
          const Gap(30),
          Container(
            height: 60,
            color: Colors.blue.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Geo-fencing Co-ordinates',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          showGeofencing = !showGeofencing;
                        });
                      },
                      icon: showGeofencing
                          ? const Icon(Icons.expand_less)
                          : const Icon(Icons.expand_more))
                ],
              ),
            ),
          ),
          const Gap(30),
          if (showGeofencing)
            Column(
              children: [
                Row(
                  children: [
                    const Text('Point 1'),
                    const Gap(5),
                    SizedBox(
                      width: 400,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        controller: _startTimeController,
                        // onTap: () => _selectTime(context),
                      ),
                    ),
                  ],
                ),

                const Gap(20),
                // Expanded(
                //   child: Row(
                //     children: [
                //       const Text('Point 2'),
                //       const Gap(5),
                //       Expanded(
                //         child: TextField(
                //           decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //           controller: _startTimeController,
                //           // onTap: () => _selectTime(context),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const Gap(20),
                // Expanded(
                //   child: Row(
                //     children: [
                //       const Text('Point 3'),
                //       const Gap(5),
                //       Expanded(
                //         child: TextField(
                //           decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //           controller: _startTimeController,
                //           // onTap: () => _selectTime(context),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // const Gap(20),
                // Expanded(
                //   child: Row(
                //     children: [
                //       const Text('Point 4'),
                //       const Gap(5),
                //       Expanded(
                //         child: TextField(
                //           decoration: InputDecoration(
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(10))),
                //           controller: _startTimeController,
                //           // onTap: () => _selectTime(context),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          const Gap(30),
          // const Text('Check attendance  by'),
          // const Gap(30),
          // Row(
          //   children: [
          //     Expanded(
          //       child: Row(
          //         children: [
          //           const Text('Employee type/status'),
          //           const Gap(5),
          //           Expanded(
          //             child: TextField(
          //               decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(10))),
          //               controller: _startTimeController,
          //               // onTap: () => _selectTime(context),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const Gap(50),
          //     Expanded(
          //       child: Row(
          //         children: [
          //           const Text('Check criteria'),
          //           const Gap(5),
          //           Expanded(
          //             child: TextField(
          //               decoration: InputDecoration(
          //                   border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(10))),
          //               controller: _startTimeController,
          //               // onTap: () => _selectTime(context),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
