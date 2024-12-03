import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/helper/functions.dart';
import '../../../controller/pin_verification_controller.dart';

class PinVerificationButton extends StatelessWidget {
  const PinVerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinVerificationController>(builder: (controller) {
      return ElevatedButton(
        onPressed: !controller.buttonActive
            ? null
            : controller.isLoading
                ? null
                : () async {
                    final bool isSuccess = await controller.verified();
                    if (controller.errorMessage.isNotEmpty) {
                      AppSnackBar.error(message: controller.errorMessage);
                    } else if (isSuccess) {
                      Get.toNamed(RoutesName.resetPassword);
                    }
                  },
        child: controller.isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
      );
    });
  }
}
