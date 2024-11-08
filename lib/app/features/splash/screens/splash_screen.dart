import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/app/features/home/screens/home_screen.dart';

import '../../../utils/helper/app_export.dart';
import '../../authentication/screens/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetStorage _storage = GetStorage();

  @override
  void initState() {
    navigateToAnotherScreen();
    super.initState();
  }

  navigateToAnotherScreen() async {
    String token = _storage.read('token') ?? '';
    await Future.delayed(const Duration(seconds: 3));
    if (token.isEmpty) {
      AppNavigator.pushAndRemoveUntil(context: context, screen: const SignInScreen());
    } else {
      AppNavigator.pushAndRemoveUntil(context: context, screen: const HomeScreen());
    }
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
