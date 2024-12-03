import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../../theme/app_theme.dart';
import '../../../controller/pin_verification_controller.dart';


class InputPinForm extends StatelessWidget {
  const InputPinForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinVerificationController>(builder: (controller) {
      return Pinput(
        length: 6,
        controller: controller.pinController,
        validator: (value)  {
          return  controller.isValid ? null : 'Pin is incorrect';
        },
        onChanged: (value) {
          controller.onChangedPin(value);
        },
        defaultPinTheme: AppTheme.defaultPinTheme,
        focusedPinTheme: AppTheme.defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.green),
        ),
        errorPinTheme: AppTheme.defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      );
    });
  }
}