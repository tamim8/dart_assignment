import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/profile/controller/image_picker_controller.dart';

import '../../features/home/controllers/home_controller.dart';
import '../../routes/routes_name.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return AppBar(
      leading: _buildUserImage(),
      title: Obx(
        () => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            controller.user.value.firstName.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            controller.user.value.email.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: _onPressedLogoutButton,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  Widget _buildUserImage() {
    final controller = Get.put(ImagePickerController());
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipOval(
        child: InkWell(
          onTap: () => _onTapProfileImage(),
          child: Obx(
            () {
              if (controller.imageBytes.value != null) {
                // Display the image
                return SizedBox.fromSize(
                  size: const Size.fromRadius(50),
                  child: Image.memory(
                    controller.imageBytes.value!,
                    fit: BoxFit.cover,
                  ),
                );
              } else {
                return const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_outlined,
                    size: 30,
                    color: Colors.grey,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _onTapProfileImage() => Get.toNamed(RoutesName.profile);

  _onPressedLogoutButton() {
    Get.defaultDialog(
      title: 'Logout Confirmation',
      content: const Text('Are you sure you want to logout?'),
      confirmTextColor: Colors.red,
      buttonColor: Colors.transparent,
      barrierDismissible: false,
      textConfirm: 'Logout',
      textCancel: 'Cancel',
      onConfirm: () {
        Get.offAllNamed(RoutesName.signIn);
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
