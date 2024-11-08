import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import 'sign_in_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email, required this.otp});

  final String email;
  final String otp;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool buttonActive = false;
  bool isLoading = false;
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    MediaQuery.sizeOf(context);
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              return value!.isNotEmpty ? null : 'Password not matches';
            },
            decoration: const InputDecoration(label: Text(AppString.passwordText)),
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          TextFormField(
            controller: _cPasswordController,
            onChanged: (value) {
              if (value == _passwordController.text) {
                buttonActive = true;
                setState(() {});
              }
            },
            validator: (value) {
              if (value != _passwordController.text) {
                return 'Password not matches';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(label: Text(AppString.confirmPasswordText)),
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          ElevatedButton(
            onPressed: buttonActive ? _resetPasswordConfirmButton : null,
            child: isLoading ? buttonLoading() : const Text(AppString.confirmationButtonText),
          ),
        ],
      ),
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

  void _resetPasswordConfirmButton() async {
    isLoading = true;
    setState(() {});
    if (_formKey.currentState!.validate()) {
      try {
        final String userInputPassword = _passwordController.text;
        final Map<String, String> body = {
          "email": widget.email,
          "OTP": widget.otp,
          "password": userInputPassword,
        };
        final bool isSuccess = await _apiService.resetPassword(body: body);

        if (isSuccess) {
          AppNavigator.pushAndRemoveUntil(
            context: context,
            screen: SignInScreen(
              email: widget.email,
              password: userInputPassword,
            ),
          );
        }
      } catch (e) {
        errorToast(msg: e.toString(), context: context);
        setState(() {});
      } finally {
        isLoading = false;
        setState(() {});
      }
    }
  }

  void _onTapSignInText() {
    AppNavigator.pushAndRemoveUntil(context: context, screen: const SignInScreen());
  }
}
