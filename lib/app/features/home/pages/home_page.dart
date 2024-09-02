import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'widgets/desktop_layout.dart';
import 'widgets/mobile_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Device.screenType == ScreenType.mobile) {
      return const MobileLayout();
    }
    return const DesktopLayout();
  }
}
