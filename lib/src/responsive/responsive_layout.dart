import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopView;
  final Widget mobileView;
  const ResponsiveLayout(
      {super.key, required this.desktopView, required this.mobileView});

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 500;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 500;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (ResponsiveLayout.isDesktop(context)) {
        return desktopView;
      } else {
        return mobileView;
      }
    }));
  }
}
