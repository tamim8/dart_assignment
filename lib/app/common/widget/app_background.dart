import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/image_path.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          ImagePath.backgroundSvg,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        child
      ],
    );
  }
}
