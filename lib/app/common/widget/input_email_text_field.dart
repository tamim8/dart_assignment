import 'package:flutter/material.dart';
import 'package:task_manager/app/utils/helper/functions.dart';

import '../../utils/constants/app_strings.dart';

class InputEmailTextField extends StatelessWidget {
  const InputEmailTextField({
    super.key,
    required this.emailTEController,
    this.onChanged,
    this.enabled = true,
  });

  final TextEditingController emailTEController; // Specify the type
  final Function(String)? onChanged; // Use a nullable function type
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: emailTEController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) return AppString.emailAddressRequiredText;
        if (!value.isValidEmail) return AppString.invalidEmailAddressText;
        return null;
      },
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: AppString.emailText),
    );
  }
}
