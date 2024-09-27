import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_strings.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                    AppString.resetPasswordScreenTitleText,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    AppString.resetPasswordScreenSubTitleText,
                    style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildResetPasswordForm(),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildResetPasswordFormFooter(textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResetPasswordForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text(AppString.passwordText)),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(
          decoration: const InputDecoration(label: Text(AppString.confirmPasswordText)),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        ElevatedButton(
          onPressed: _resetPasswordConfirmButton,
          child: const Text(AppString.confirmationButtonText),
        ),
      ],
    );
  }

  Widget _buildResetPasswordFormFooter(TextTheme textTheme) {
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

  void _resetPasswordConfirmButton() {
    //  TODO: implement sign in button method
  }

  void _onTapSignInText() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }
}
