import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/features/authentication/screens/pin_verification_screen.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_strings.dart';
import 'sign_in_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.sizeOf(context);
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0, vertical: 140),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.forgetPasswordScreenTitleText,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    AppString.forgetPasswordScreenSubTitleText,
                    style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildForgetPasswordForm(),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildForgetPasswordFormFooter(textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgetPasswordForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            label: Text(AppString.emailText),
          ),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        ElevatedButton(
          onPressed: _nextButton,
          child: const Icon(Icons.chevron_right_outlined, size: 30),
        ),
      ],
    );
  }

  Widget _buildForgetPasswordFormFooter(TextTheme textTheme) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: AppString.alreadyHaveAccountText,
          style: textTheme.titleMedium!.copyWith(color: Colors.black),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = _onTapSignInText,
              text: AppString.signInText,
              style: textTheme.titleMedium!.copyWith(color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }

  void _nextButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PinVerificationScreen(),
      ),
    );
  }

  void _onTapSignInText() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }
}
