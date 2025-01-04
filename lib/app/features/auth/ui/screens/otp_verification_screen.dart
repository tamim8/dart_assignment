import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../../utils/constants/app_sizes.dart';
import '../../../../utils/constants/app_strings.dart';
import '../controllers/auth_controller.dart';
import '../widgets/app_logo_widget.dart';
import '../widgets/form_header.dart';
import '../widgets/input_pin_form.dart';
import '../widgets/verification_button.dart';


class OTPVerificationScreen extends StatelessWidget {
  final AuthController _controller = Get.find<AuthController>();

  OTPVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _controller.startCountDown();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoWidget(),
              SizedBox(height: AppSizes.xl),
              const FormHeader(
                title: AppString.otpScreenTitleText,
                subTitle: AppString.otpScreenSubTitleText,
              ),
              SizedBox(height: AppSizes.xl),
              InputPinForm(),
              SizedBox(height: AppSizes.xl),
              OTPVerificationButton(),
              SizedBox(height: AppSizes.xl),
              Obx(() {
                if (_controller.remainingTime.value < 1) {
                  return const SizedBox.shrink();
                }
                return RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    text: AppString.otpExpireText,
                    children: [
                      TextSpan(
                        text: '${_controller.remainingTime.value}s',
                        style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              Obx(() {
                return TextButton(
                  onPressed: _controller.remainingTime.value < 1 ? () => _controller.startCountDown() : null,
                  child: const Text('Resend Code'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
