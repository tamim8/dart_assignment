import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/image_path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Center(
          child: SvgPicture.asset(
            ImagePath.logoSvg,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
