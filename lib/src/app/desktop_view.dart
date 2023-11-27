import 'package:flutter/material.dart';
import 'package:hr_app/src/features/announcement/annoucement_screen.dart';
import 'package:hr_app/src/features/calender/calender_screen.dart';
import 'package:hr_app/src/features/employees/employees_screen_desktop.dart';
import 'package:hr_app/src/features/holidays/holiday_screen_desktop.dart';
import 'package:hr_app/src/features/home/home.dart';
import 'package:hr_app/src/features/leaves/leave_applications.dart';
import 'package:hr_app/src/features/notifications/notification.dart';
import 'package:hr_app/src/features/settings/settings_screen_desktop.dart';
import 'package:hr_app/src/features/teams/teams.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({Key? key}) : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const Home(),
    const CalenderScreen(),
    const AnnoucementScreen(),
    const TeamsScreen(),
    const EmployeesScreenDesktop(),
    const LeaveApplicationScreen(),
    const Placeholder(),
    const HolidayScreenDesktop(),
    const SettingsScreenDesktop(),
    const NotificationScreen(),
    const Placeholder(),
  ];
  bool isShowOptions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  selected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_today),
                  title: const Text('My calendar'),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.announcement),
                  title: const Text('Announcements'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Management'),
                  onTap: () {
                    setState(() {
                      isShowOptions = !isShowOptions;
                    });
                  },
                ),
                if (isShowOptions)
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('Employees management'),
                          onTap: () {
                            setState(() {
                              _selectedIndex = 4;
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.people),
                          title: const Text('Teams management'),
                          onTap: () {
                            setState(() {
                              _selectedIndex = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ListTile(
                  leading: const Icon(Icons.settings_applications),
                  title: const Text('Leave applications'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 5;
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
                      _selectedIndex = 7;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {
                    setState(() {
                      _selectedIndex = 8;
                    });
                  },
                ),
                const ListTile(
                  leading: Icon(Icons.flight),
                  title: Text('Applications'),
                  // onTap: () {
                  //   setState(() {
                  //     _selectedIndex = ;
                  //   });
                  // },
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
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _views[_selectedIndex],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
