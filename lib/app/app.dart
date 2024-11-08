import 'package:flutter/material.dart';
import 'package:task_manager/app/features/home/screens/home_screen.dart';
import 'package:task_manager/app/theme/app_theme.dart';

import 'features/authentication/screens/pin_verification_screen.dart';
import 'features/splash/screens/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
      // home: const PinVerificationScreen(email: 'tammh40@gmail.com',),
    );
  }
}
