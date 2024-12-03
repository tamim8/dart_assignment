import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/routes_name.dart';

import '../../../../common/widget/app_background.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../controller/forget_password_controller.dart';
import '../widgets/form_footer.dart';
import '../widgets/form_header.dart';
import '../../../../common/widget/input_email_text_field.dart';
import 'widgets/email_verification_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.fromPadding, vertical: 140),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeader(
                  title: AppString.forgetPasswordScreenTitleText,
                  subTitle: AppString.forgetPasswordScreenSubTitleText,
                ),
                SizedBox(height: AppSizes.lHeight),
                _buildForgetPasswordForm(),
                SizedBox(height: AppSizes.lHeight),
                const EmailVerificationButton(),
                SizedBox(height: AppSizes.lHeight),
                FormFooter(
                  button: _onTapSignInText,
                  buttonText: AppString.signInText,
                  description: AppString.alreadyHaveAccountText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordForm() {
    return GetBuilder<ForgetPasswordController>(
      builder: (controller) {
        return Column(
          children: [
            InputEmailTextField(
              emailTEController: controller.emailTEController,
              onChanged: (email) {
                controller.onChangeEmail(email);
              },
            ),
          ],
        );
      },
    );
  }

  void _onTapSignInText() => Get.offAndToNamed(RoutesName.signIn);
}
