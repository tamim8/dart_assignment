import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/routes_name.dart';
import '../../../../utils/helper/functions.dart';
import '../../controller/auth_controller.dart';

class SignInButton extends StatelessWidget {
  final AuthController _controller = Get.find<AuthController>();

  SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        onPressed: !_controller.isActiveSignInBtn.value
            ? null
            : _controller.isLoading.value
                ? null
                : () async {
                    Get.toNamed(RoutesName.otpVerify);
                    // final bool isSuccess = await controller.signIn();
                    // if (controller.errorMessage.isNotEmpty) {
                    //   AppSnackBar.error(message: controller.errorMessage);
                    // } else if (isSuccess) {
                    //   Get.offAllNamed(RoutesName.home);
                    // }
                  },
        child: _controller.isLoading.value ? buttonLoading() : const Text('Next'),
      ),
    );
  }
}
