import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_strings.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                    AppString.signUpScreenTitleText,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildSignUpForm(),
                  SizedBox(height: AppSizes.lVerticalSpace),
                  _buildSingUpFormFooter(textTheme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            label: Text(AppString.emailText),
          ),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(
          decoration: const InputDecoration(
            label: Text(AppString.firstNameText),
          ),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(
          decoration: const InputDecoration(
            label: Text(AppString.lastNameText),
          ),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(label: Text(AppString.mobileNoText)),
        ),
        SizedBox(height: AppSizes.lVerticalSpace),
        TextFormField(decoration: const InputDecoration(label: Text(AppString.passwordText))),
        SizedBox(height: AppSizes.lVerticalSpace),
        ElevatedButton(
          onPressed: _signUpButton,
          child: const Icon(Icons.chevron_right_outlined, size: 30),
        ),
      ],
    );
  }

  Widget _buildSingUpFormFooter(TextTheme textTheme) {
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

  void _signUpButton() {
    //  TODO: implement sign in button method
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
