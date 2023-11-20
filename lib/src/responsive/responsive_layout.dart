import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopView;
  final Widget mobileView;
  const ResponsiveLayout(
      {super.key, required this.desktopView, required this.mobileView});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.minWidth > 550) {
        return desktopView;
      } else {
        return mobileView;
      }
    }));
  }
}
