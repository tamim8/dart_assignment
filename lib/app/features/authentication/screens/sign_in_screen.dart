import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_strings.dart';
import 'forget_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                    AppString.signInScreenTitleText,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildSignInForm(),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildSingInFormFooter(textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(label: Text(AppString.emailText)),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(label: Text(AppString.passwordText)),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        ElevatedButton(
          onPressed: _signInButton,
          child: const Icon(Icons.chevron_right_outlined, size: 30),
        ),
      ],
    );
  }

  Widget _buildSingInFormFooter(TextTheme textTheme) {
    return Center(
      child: Column(
        children: [
          TextButton(
            onPressed: _forgetPasswordButton,
            child: Text(
              AppString.forgotPasswordText,
              style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
            ),
          ),
          RichText(
            text: TextSpan(
              text: AppString.dontHaveAccountText,
              style: textTheme.titleMedium!.copyWith(color: Colors.black),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = _onTapSignUpText,
                  text: AppString.signUpText,
                  style: textTheme.titleMedium!.copyWith(color: AppColors.primary),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signInButton() {
    //  TODO: implement sign in button method
  }

  void _forgetPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      ),
    );
  }

  void _onTapSignUpText() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }
}


