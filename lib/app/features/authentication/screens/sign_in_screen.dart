import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/data/services/api_service.dart';
import 'package:task_manager/app/features/home/screens/home_screen.dart';

import '../../../utils/helper/app_export.dart';
import '../models/user_model.dart';
import 'forget_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.email, this.password});

  final String? email;
  final String? password;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final ApiService _apiService = ApiService();
  bool isLoading = false;

  @override
  void initState() {
    if (widget.email != null && widget.password != null) {
      _emailTEController.text = widget.email!;
      _passwordTEController.text = widget.password!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) return AppString.emailAddressRequiredText;
              if (!value.isValidEmail) return AppString.invalidEmailAddressText;
              return null;
            },
            decoration: const InputDecoration(label: Text(AppString.emailText)),
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          TextFormField(
            controller: _passwordTEController,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) return AppString.passwordRequiredText;
              return null;
            },
            decoration: const InputDecoration(label: Text(AppString.passwordText)),
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          ElevatedButton(
            onPressed: _signInButton,
            child: isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
          ),
        ],
      ),
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

  void _signInButton() async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});

      UserModel user = UserModel.loginUser(email: _emailTEController.text.trim(), password: _passwordTEController.text);
      final isLogin = await _apiService.login(user: user);
      isLoading = false;
      if (isLogin) {
        successToast(msg: 'Success!', context: context);
        setState(() {});
        AppNavigator.pushAndRemoveUntil(context: context, screen: const HomeScreen());

      } else {
        errorToast(msg: 'Invalid user info', context: context);
        setState(() {});
      }
    }
  }

  void _forgetPasswordButton() {
    AppNavigator.push(context: context, screen: const ForgetPasswordScreen());

  }

  void _onTapSignUpText() {
    AppNavigator.push(context: context, screen: const SignUpScreen());

  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
