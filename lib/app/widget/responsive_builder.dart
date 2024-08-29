import 'package:flutter/material.dart';

import '../utils/device_utils.dart';
import '../utils/constance/enums.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    DeviceType device = DeviceUtils.getDeviceType(width: size.width);

    if (device == DeviceType.desktop) {
      return desktop;
    } else if (device == DeviceType.tablet && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}
