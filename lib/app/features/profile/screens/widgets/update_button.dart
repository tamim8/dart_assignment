import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../utils/helper/functions.dart';
import '../../controller/profile_controller.dart';

class ProfileUpdateButton extends StatelessWidget {
  const ProfileUpdateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () async {
                await controller.updateProfileInfo();
                if (controller.errorMessage.value.isEmpty) {
                  AppSnackBar.success(message: 'Updated Success');
                } else {
                  AppSnackBar.error(message: controller.errorMessage.value);
                }
              },
        child:
            controller.isLoading.value ? buttonLoading() : const Text('Update'),
      );
    });
  }
}
