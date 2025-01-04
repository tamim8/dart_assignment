import 'package:flutter/material.dart';

import 'routes_name.dart';
import 'views.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    late Widget widget;

    switch (settings.name) {
      case RoutesName.initial:
        widget = SplashScreen();
      case RoutesName.login:
        widget = SignInScreen();
      case RoutesName.otpVerify:
        widget = OTPVerificationScreen();
      case RoutesName.mainScreen:
        widget = MainBottomNavBarScreen();
      case RoutesName.productList:
        final String title = settings.arguments as String;
        widget = ProductListScreen(title: title);
      case RoutesName.productDetails:
        final int productId = settings.arguments as int;
        widget = ProductDetailsScreen(id: productId);
      case RoutesName.productReview:
        widget = const ProductReviewScreen();

      default:
        widget = const Scaffold(
          body: Center(child: Text('No route generated')),
        );
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
