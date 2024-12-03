import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/app_background.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../widgets/form_footer.dart';
import '../widgets/form_header.dart';
import 'widgets/reset_password_button.dart';
import 'widgets/reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.fromPadding, vertical: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormHeader(
                    title: AppString.resetPasswordScreenTitleText,
                    subTitle: AppString.resetPasswordScreenSubTitleText,
                  ),
                  SizedBox(height: AppSizes.lHeight),
                 const ResetPasswordForm(),
                  SizedBox(height: AppSizes.lHeight),
                 const ResetPasswordButton(),
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
      ),
    );
  }

  void _onTapSignInText() => Get.offAllNamed(RoutesName.signIn);
}
