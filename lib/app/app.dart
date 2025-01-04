import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_getx/app/routes/routes.dart';
import 'package:ecommerce_getx/app/theme/app_theme.dart';

import 'features/auth/bindings/auth_bindings.dart';
import 'routes/routes_name.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce (GetX)',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      onGenerateRoute: Routes.generateRoutes,
      initialRoute: RoutesName.initial,
      initialBinding: AuthBinding(),
    );
  }
}
