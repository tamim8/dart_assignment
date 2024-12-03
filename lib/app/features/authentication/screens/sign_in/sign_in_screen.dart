import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/common/widget/app_background.dart';
import 'package:task_manager/app/features/authentication/controller/sign_in_controller.dart';
import 'package:task_manager/app/features/authentication/screens/widgets/form_header.dart';
import 'package:task_manager/app/routes/routes_name.dart';
import 'package:task_manager/app/utils/constants/app_sizes.dart';

import '../../../../utils/constants/app_strings.dart';
import 'widgets/forget_password_button.dart';
import '../widgets/form_footer.dart';
import '../../../../common/widget/input_email_text_field.dart';
import '../../../../common/widget/input_password_text_field.dart';
import 'widgets/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, this.email, this.password});

  final String? email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    // Get.find<SignInController>().onReady();
    return AppBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FormHeader(title: AppString.signInScreenTitleText),
            SizedBox(height: AppSizes.lHeight),
            _buildSignInForm(),
            SizedBox(height: AppSizes.lHeight),
            const SignInButton(),
            SizedBox(height: AppSizes.lHeight),
            const ForgetPasswordButton(),
            FormFooter(
              button: _onTapSignUpText,
              buttonText: AppString.signUpText,
              description: AppString.dontHaveAccountText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Column(
          children: [
            InputEmailTextField(
              emailTEController: controller.emailTEController,
              onChanged: (value) => controller.onChangedEmailOrPassword(value),
            ),
            SizedBox(height: AppSizes.lHeight),
            InputPasswordTextField(
              passwordTEController: controller.passwordTEController,
              onChanged: (value) => controller.onChangedEmailOrPassword(value),
            ),
          ],
        );
      },
    );
  }

  void _onTapSignUpText() => Get.toNamed(RoutesName.signUp);
}
