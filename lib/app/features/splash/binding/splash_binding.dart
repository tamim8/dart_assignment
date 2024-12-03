import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_api_repository.dart';
import 'package:task_manager/app/features/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(AuthApiRepository()));
  }
}
