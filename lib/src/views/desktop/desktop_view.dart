import 'package:flutter/material.dart';
import 'package:hr_app/src/views/desktop/desktop_annoucement.dart';
import 'package:hr_app/src/views/desktop/desktop_calender.dart';
import 'package:hr_app/src/views/desktop/desktop_employees.dart';
import 'package:hr_app/src/views/desktop/desktop_holiday.dart';
import 'package:hr_app/src/views/home.dart';
import 'package:hr_app/src/views/leave_applications.dart';
import 'package:hr_app/src/views/notification.dart';
import 'package:hr_app/src/views/teams.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    Home(),
    DesktopCalender(),
    DesktopAnnouncement(),
    TeamsScreen(),
    DesktopEmployees(),
    LeaveApplicationScreen(),
    Placeholder(),
    DesktopHoliday(),
    NotificationScreen(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Ashley Cole'),
                  accountEmail: Text('cole08@email.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 48,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  selected: _currentIndex == 0,
                  onTap: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('My calendar'),
                  selected: _currentIndex == 1,
                  onTap: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.announcement),
                  title: const Text('Announcements'),
                  onTap: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Teams management'),
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Employees management'),
                  onTap: () {
                    setState(() {
                      _currentIndex = 4;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Leave applications'),
                  onTap: () {
                    setState(() {
                      _currentIndex = 5;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.payment),
                  title: const Text('Payroll'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.flight),
                  title: const Text('Holiday management'),
                  onTap: () {
                    setState(() {
                      _currentIndex = 7;
                    });
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text('Reporting'),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                ),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 9,
            child: _views[_currentIndex],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
