import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/helper/functions.dart';
import '../../../controller/sign_in_controller.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return ElevatedButton(
        onPressed: !controller.buttonActive
            ? null
            : controller.isLoading
                ? null
                : () async {
                    final bool isSuccess = await controller.signIn();
                    if (controller.errorMessage.isNotEmpty) {
                      AppSnackBar.error(message: controller.errorMessage);
                    } else if (isSuccess) {
                      Get.offAllNamed(RoutesName.home);
                    }
                  },
        child: controller.isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
      );
    });
  }
}
