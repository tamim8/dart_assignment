
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/data/repository/auth_repository.dart';
import 'package:task_manager/app/routes/routes_name.dart';
import 'package:task_manager/app/utils/secure_storage/secure_storage.dart';

class SplashController extends GetxController {
  final SecureStorage _storage = SecureStorage();
  final AuthRepository _authRepository;

  SplashController(this._authRepository);

  @override
  void onInit() {
    super.onInit();
    navigateToAnotherScreen();
  }

  Future<void> navigateToAnotherScreen() async {
    String token = await _storage.read(key: SSKey.token);

    if (token.isNotEmpty) {
      await _authRepository.tokenValidation().then((onValue) {
        Get.offAllNamed(RoutesName.home);
      }).onError((e, s) {
        Get.offAllNamed(RoutesName.signIn);
      });
    } else {
      Get.offAllNamed(RoutesName.signIn);
    }
  }
}
