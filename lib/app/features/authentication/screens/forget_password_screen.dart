import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/features/authentication/screens/pin_verification_screen.dart';
import 'package:task_manager/app/utils/helper/app_export.dart';

import '../../../data/services/api_service.dart';
import 'sign_in_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

  final ApiService _apiService = ApiService();
  bool isLoading = false;

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text(AppString.emailText),
            ),
            validator: (value) {
              if (value!.isEmpty) return AppString.emailAddressRequiredText;
              if (!value.isValidEmail) return AppString.invalidEmailAddressText;
              return null;
            },
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          ElevatedButton(
            onPressed: isLoading ? null : _nextButton,
            child: isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
          ),
        ],
      ),
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

  _nextButton() async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      final String email = _emailTEController.text.trim();
      try {
        await _apiService.verifyEmail(emailId: email);
        setState(() {});

        AppNavigator.pushReplacement(
          context: context,
          screen: PinVerificationScreen(
            email: email,
          ),
        );
      } catch (e) {
        errorToast(msg: e.toString(), context: context);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _onTapSignInText() {
    AppNavigator.pushAndRemoveUntil(context: context, screen: const SignInScreen());
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
