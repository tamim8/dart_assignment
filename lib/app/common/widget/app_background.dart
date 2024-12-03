import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/image_path.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.appBar,
  });

  final AppBar? appBar;
  final Widget child;
  final EdgeInsets padding;

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
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: Padding(
            padding: padding,
            child: child,
          ),
        )
      ],
    );
  }
}
