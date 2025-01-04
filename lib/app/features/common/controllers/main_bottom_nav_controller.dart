import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void setIndex(int index) => selectedIndex(index);

  void get backToHome => selectedIndex(0);

  get moveToCategory => selectedIndex(1);
}
