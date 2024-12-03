import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/controller/reset_password_controller.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/helper/functions.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (controller) {
      return ElevatedButton(
        onPressed: !controller.buttonActive
            ? null
            : controller.isLoading
                ? null
                : () async {
                    final bool isSuccess = await controller.setNewPassword();
                    if (controller.errorMessage.isNotEmpty) {
                      AppSnackBar.error(message: controller.errorMessage);
                    } else if (isSuccess) {
                      Get.offAllNamed(RoutesName.signIn);
                    }
                  },
        child: controller.isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
      );
    });
  }
}
