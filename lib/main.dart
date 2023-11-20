import 'package:flutter/material.dart';
import 'package:hr_app/src/responsive/responsive_layout.dart';
import 'package:hr_app/src/views/desktop/desktop_view.dart';
import 'package:hr_app/src/views/mobile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HR APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
          desktopView: DesktopView(), mobileView: MobileView()),
    );
  }
}
