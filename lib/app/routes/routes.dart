import 'package:get/get.dart';

import 'routes_name.dart';
import 'views.dart';

class Routes {
  static get routes => [
        GetPage(
          name: RoutesName.initial,
          page: () =>  SplashScreen(),
          binding: AuthBinding()
        ),
        GetPage(
          name: RoutesName.login,
          page: () =>  SignInScreen(),
            binding: AuthBinding()
        ),
        GetPage(
          name: RoutesName.otpVerify,
          page: () =>  OTPVerificationScreen(),
        ),
        GetPage(
          name: RoutesName.profile,
          page: () =>  ProfileScreen(),
        ),
        GetPage(
          name: RoutesName.home,
          page: () => MainBottomNavBarScreen(),
          binding: HomeBinding(),
        ),
      ];
}
