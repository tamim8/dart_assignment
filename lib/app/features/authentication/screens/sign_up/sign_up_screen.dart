import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/app_background.dart';
import '../../../../common/widget/input_email_text_field.dart';
import '../../../../common/widget/input_password_text_field.dart';
import '../../../../common/widget/input_phone_number_text_field.dart';
import '../../../../common/widget/input_plane_text_field.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../controller/sign_up_controller.dart';
import '../widgets/form_footer.dart';
import '../widgets/form_header.dart';
import 'widgets/sign_up_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeader(title: AppString.signUpScreenTitleText),
              SizedBox(height: AppSizes.lHeight),
              _buildSignUpForm(),
              SizedBox(height: AppSizes.lHeight),
              const SignUpButton(),
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
    );
  }

  Widget _buildSignUpForm() {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Form(
          key: controller.formKey,
          child: Column(
            children: [
              InputEmailTextField(emailTEController: controller.emailTEController),
              SizedBox(height: AppSizes.lHeight),
              InputPlaneTextField(
                tEController: controller.firstNameTEController,
                label: AppString.firstNameText,
              ),
              SizedBox(height: AppSizes.lHeight),
              InputPlaneTextField(
                tEController: controller.lastNameTEController,
                label: AppString.lastNameText,
              ),
              SizedBox(height: AppSizes.lHeight),
              InputPhoneNoTextField(
                numberTEController: controller.mobileNoTEController,
              ),
              SizedBox(height: AppSizes.lHeight),
              InputPasswordTextField(passwordTEController: controller.passwordTEController),
            ],
          ),
        );
      },
    );
  }

  void _onTapSignInText() => Get.offAndToNamed(RoutesName.signIn);
}
