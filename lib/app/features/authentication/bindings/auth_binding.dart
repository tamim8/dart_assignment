import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/controller/forget_password_controller.dart';
import 'package:task_manager/app/features/authentication/controller/pin_verification_controller.dart';
import 'package:task_manager/app/features/authentication/controller/reset_password_controller.dart';

import '../controller/sign_in_controller.dart';
import '../controller/sign_up_controller.dart';
import '../data/repository/auth_api_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController(AuthApiRepository()));
    Get.lazyPut(() => ForgetPasswordController(AuthApiRepository()));
    Get.lazyPut(() => PinVerificationController(AuthApiRepository()));
    Get.lazyPut(() => ResetPasswordController(AuthApiRepository()));
    Get.lazyPut(() => SignUpController(AuthApiRepository()));
  }
}
