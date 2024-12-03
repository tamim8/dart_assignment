import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/screens/reset_password/reset_password_screen.dart';
import 'package:task_manager/app/features/authentication/screens/sign_up/sign_up_screen.dart';
import 'package:task_manager/app/features/profile/screens/profile_screen.dart';

import '../features/authentication/bindings/auth_binding.dart';
import '../features/authentication/screens/forgot_password/forget_password_screen.dart';
import '../features/authentication/screens/pin_verification/pin_verification_screen.dart';
import '../features/authentication/screens/sign_in/sign_in_screen.dart';
import '../features/home/bindings/home_binding.dart';
import '../features/profile/bindings/profile_binding.dart';
import '../features/splash/binding/splash_binding.dart';
import 'routes_name.dart';
import 'views.dart';

class Routes {
  static get routes => [
        GetPage(
          name: RoutesName.splash,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: RoutesName.signUp,
          page: () => const SignUpScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: RoutesName.signIn,
          page: () => const SignInScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: RoutesName.forgetPassword,
          page: () => const ForgetPasswordScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: RoutesName.pinVerify,
          page: () => const PinVerificationScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: RoutesName.resetPassword,
          page: () => const ResetPasswordScreen(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: RoutesName.home,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: RoutesName.profile,
          page: () => const ProfileScreen(),
          binding: ProfileBinding(),
        ),
      ];
}
