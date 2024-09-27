import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/app/utils/constants/image_path.dart';

import '../../../common/widget/app_background.dart';
import '../../authentication/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToAnotherScreen();
    super.initState();
  }

  Future<void> navigateToAnotherScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInScreen(), maintainState: true),
    );
  }

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
