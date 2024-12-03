import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/common/widget/input_email_text_field.dart';
import 'package:task_manager/app/common/widget/input_phone_number_text_field.dart';
import 'package:task_manager/app/common/widget/input_plane_text_field.dart';

import '../../../../utils/constants/app_sizes.dart';
import '../../controller/profile_controller.dart';

class ProfileInfoForm extends StatelessWidget {
  const ProfileInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          Obx(() {
            return InputEmailTextField(
                emailTEController: controller.emailTEController.value,
                enabled: false);
          }),
          SizedBox(height: AppSizes.lHeight),
          Obx(() {
            return InputPlaneTextField(
              tEController: controller.firstNameTEController.value,
              label: 'First Name',
            );
          }),
          SizedBox(height: AppSizes.lHeight),
          Obx(() {
            return InputPlaneTextField(
              tEController: controller.lastNameTEController.value,
              label: 'Last Name',
            );
          }),
          SizedBox(height: AppSizes.lHeight),
          Obx(() {
            return InputPhoneNoTextField(
                numberTEController: controller.mobileNoTEController.value);
          }),
        ],
      ),
    );
  }
}
