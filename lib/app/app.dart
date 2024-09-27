import 'package:flutter/material.dart';
import 'package:task_manager/app/features/authentication/screens/sign_in_screen.dart';
import 'package:task_manager/app/theme/app_theme.dart';

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
      home:  SignInScreen(),
    );
  }

}
