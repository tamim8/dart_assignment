import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/app/features/authentication/models/user_model.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileNoTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
          TextFormField(
            controller: _firstNameTEController,
            decoration: const InputDecoration(
              label: Text(AppString.firstNameText),
            ),
            validator: (value) {
              if (value!.isEmpty) return 'First Name is required';
              return null;
            },
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          TextFormField(
            controller: _lastNameTEController,
            decoration: const InputDecoration(
              label: Text(AppString.lastNameText),
            ),
            validator: (value) {
              if (value!.isEmpty) return 'Last Name is required';
              return null;
            },
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          TextFormField(
            controller: _mobileNoTEController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(label: Text(AppString.mobileNoText)),
            validator: (value) {
              if (value!.isEmpty) return 'Mobile No is required';
              return null;
            },
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          TextFormField(
            controller: _passwordTEController,
            decoration: const InputDecoration(label: Text(AppString.passwordText)),
            validator: (value) {
              if (value!.isEmpty) return 'Password is required';
              return null;
            },
          ),
          SizedBox(height: AppSizes.lVerticalSpace),
          ElevatedButton(
            onPressed: isLoading ? null : _signUpButton,
            child: isLoading ? buttonLoading() : const Icon(Icons.chevron_right_outlined, size: 30),
          ),
        ],
      ),
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

  _signUpButton() async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      UserModel user = UserModel(
          email: _emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          mobile: _mobileNoTEController.text.trim(),
          password: _passwordTEController.text);
      try {
        await _apiService.registration(user: user);
        successToast(msg: 'Success!', context: context);
        setState(() {});
        AppNavigator.pushAndRemoveUntil(
            context: context,
            screen: SignInScreen(
              email: _emailTEController.text.trim(),
              password: _passwordTEController.text,
            ));
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
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileNoTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
