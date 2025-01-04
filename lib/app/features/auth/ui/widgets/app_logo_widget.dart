import 'package:ecommerce_getx/app/utils/constants/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
    this.height = 100,
    this.width = 80,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImagePath.logoSvg,
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
