import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../controllers/task_controller.dart';
import '../data/repository/task_api_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TaskController(TaskApiRepository()));
  }
}
