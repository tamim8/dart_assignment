import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/helper/functions.dart';
import '../../../controller/sign_up_controller.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return ElevatedButton(
        onPressed: controller.isLoading
            ? null
            : () async {
                final bool isSuccess = await controller.signUp();
                if (controller.errorMessage.isNotEmpty) {
                  AppSnackBar.error(message: controller.errorMessage);
                } else if (isSuccess) {
                  Get.offAllNamed(RoutesName.signIn);
                }
              },
        child: controller.isLoading
            ? buttonLoading()
            : const Icon(Icons.chevron_right_outlined, size: 30),
      );
    });
  }
}
