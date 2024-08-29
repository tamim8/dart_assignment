import 'package:flutter/material.dart';

import '../../../widget/responsive_builder.dart';
import 'widgets/desktop_layout.dart';
import 'widgets/mobile_layout.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilder(
      mobile: MobileLayout(),
      tablet: DesktopLayout(),
      desktop: DesktopLayout(),
    );
  }
}
