import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/helper/functions.dart';
import '../../../controller/forget_password_controller.dart';

class EmailVerificationButton extends StatelessWidget {
  const EmailVerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(builder: (controller) {
      return ElevatedButton(
        onPressed: !controller.isValidEmail
            ? null
            : controller.isLoading
                ? null
                : () async {
                    final bool isSuccess = await controller.emailVerify();
                    if (controller.errorMessage.isNotEmpty) {
                      AppSnackBar.error(message: controller.errorMessage);
                    } else if (isSuccess) {
                      Get.offAllNamed(RoutesName.pinVerify);
                    }
                  },
        child: controller.isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
      );
    });
  }
}
