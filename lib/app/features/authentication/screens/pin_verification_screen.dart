import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:task_manager/app/features/authentication/screens/reset_password_screen.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import 'sign_in_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pinController = TextEditingController();
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
                    AppString.pinVerificationScreenTitleText,
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    AppString.pinVerificationScreenSubTitleText,
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
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            controller: _pinController,
            validator: (value) {
              return isValid ? null : 'Pin is incorrect';
            },
            onCompleted: (pin) {
              buttonActive = true;
              _pinVerifyButton();
              setState(() {});
            },
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.green),
            ),
            errorPinTheme: defaultPinTheme.copyBorderWith(
              border: Border.all(color: Colors.redAccent),
            ),
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          ElevatedButton(
            onPressed: buttonActive ? _pinVerifyButton : null,
            child: isLoading ? buttonLoading() : const Text(AppString.verifyButtonText),
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

  _pinVerifyButton() async {
    isLoading = true;
    setState(() {});
    try {
      final String userInputPin = _pinController.text.toString();
      isValid = await _apiService.verifyPin(email: widget.email, pin: userInputPin);

      if (_formKey.currentState!.validate()) {
        AppNavigator.pushReplacement(
          context: context,
          screen: ResetPasswordScreen(
            email: widget.email,
            otp: userInputPin,
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

  void _onTapSignInText() {
    AppNavigator.pushAndRemoveUntil(context: context, screen: const SignInScreen());
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}
