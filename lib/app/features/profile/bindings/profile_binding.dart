import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../data/repository/profile_api_repository.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(ProfileApiRepository()));
  }
}
