import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/app_sizes.dart';
import '../../../../../utils/constants/app_strings.dart';
import '../../../controller/reset_password_controller.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (controller) {
      return Column(
        children: [
          TextFormField(
            controller: controller.passwordController,
            decoration: const InputDecoration(label: Text(AppString.passwordText)),
          ),
          SizedBox(height: AppSizes.lHeight),
          TextFormField(
            controller: controller.cPasswordController,
            onChanged: (value) {
              controller.onChangedConfirmPassword(value);
            },
            validator: (value) {
              if (value != controller.passwordController.text) {
                return 'Password not matches';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(label: Text(AppString.confirmPasswordText)),
          ),
        ],
      );
    });
  }
}
