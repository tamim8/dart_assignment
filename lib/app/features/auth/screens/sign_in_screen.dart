import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_getx/app/features/auth/controller/auth_controller.dart';
import 'package:ecommerce_getx/app/features/auth/screens/widgets/form_header.dart';
import 'package:ecommerce_getx/app/utils/constants/app_sizes.dart';

import '../../../utils/constants/app_strings.dart';
import 'widgets/app_logo_widget.dart';
import '../../common/widget/input_email_text_field.dart';
import 'widgets/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthController _controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 140),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogoWidget(),
            SizedBox(height: AppSizes.xl),
            const FormHeader(
              title: AppString.signInScreenTitleText,
              subTitle: AppString.signInScreenSubTitleText,
            ),
            SizedBox(height: AppSizes.xl),
            InputEmailTextField(
              emailTEController: _controller.emailTEController,
              onChanged: (value) => _controller.onChangedEmail(value),
            ),
            SizedBox(height: AppSizes.xl),
            SignInButton(),
          ],
        ),
      ),
    );
  }
}
