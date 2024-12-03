import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/authentication/controller/sign_in_controller.dart';

import '../../../../../routes/routes_name.dart';
import '../../../../../utils/constants/app_strings.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: GetBuilder<SignInController>(builder: (controller) {
        return TextButton(
          onPressed: _forgetPasswordButton,
          child: Text(
            AppString.forgotPasswordText,
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        );
      }),
    );
  }

  void _forgetPasswordButton() => Get.toNamed(RoutesName.forgetPassword);
}
