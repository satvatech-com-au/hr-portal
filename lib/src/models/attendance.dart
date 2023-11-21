import 'package:flutter/material.dart';

class AttendanceEntry {
  final int serialNumber;
  final DateTime date;
  final TimeOfDay clockInTime;
  final TimeOfDay clockOutTime;

  AttendanceEntry({
    required this.serialNumber,
    required this.date,
    required this.clockInTime,
    required this.clockOutTime,
  });
}

final List<AttendanceEntry> attendance = [
  AttendanceEntry(
    serialNumber: 1,
    date: DateTime.now(),
    clockInTime: const TimeOfDay(hour: 9, minute: 0),
    clockOutTime: const TimeOfDay(hour: 17, minute: 30),
  ),
  AttendanceEntry(
    serialNumber: 1,
    date: DateTime.now(),
    clockInTime: const TimeOfDay(hour: 9, minute: 0),
    clockOutTime: const TimeOfDay(hour: 17, minute: 30),
  ),
  AttendanceEntry(
    serialNumber: 1,
    date: DateTime.now(),
    clockInTime: const TimeOfDay(hour: 9, minute: 0),
    clockOutTime: const TimeOfDay(hour: 17, minute: 30),
  ),
  AttendanceEntry(
    serialNumber: 1,
    date: DateTime.now(),
    clockInTime: const TimeOfDay(hour: 9, minute: 0),
    clockOutTime: const TimeOfDay(hour: 17, minute: 30),
  ),
  AttendanceEntry(
    serialNumber: 1,
    date: DateTime.now(),
    clockInTime: const TimeOfDay(hour: 9, minute: 0),
    clockOutTime: const TimeOfDay(hour: 17, minute: 30),
  )
];
