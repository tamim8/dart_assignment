import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/app_background.dart';
import '../../../../routes/routes_name.dart';
import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../widgets/form_footer.dart';
import '../widgets/form_header.dart';
import 'widgets/input_pin_form.dart';
import 'widgets/verification_button.dart';

class PinVerificationScreen extends StatelessWidget {
   const PinVerificationScreen({super.key});

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
                  title: AppString.pinVerificationScreenTitleText,
                  subTitle: AppString.pinVerificationScreenSubTitleText,
                ),
                SizedBox(height: AppSizes.lHeight),
                const InputPinForm(),
                SizedBox(height: AppSizes.lHeight),
                const PinVerificationButton(),
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

  void _onTapSignInText() => Get.offAllNamed(RoutesName.signIn);
}
