import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/routes.dart';
import 'package:task_manager/app/theme/app_theme.dart';

import 'routes/routes_name.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      getPages: Routes.routes,
      initialRoute: RoutesName.splash,
      // home: const PinVerificationScreen(email: 'tammh40@gmail.com',),
    );
  }
}
