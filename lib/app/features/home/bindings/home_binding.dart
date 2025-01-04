import 'package:ecommerce_getx/app/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainBottomNavController());
  }
}
