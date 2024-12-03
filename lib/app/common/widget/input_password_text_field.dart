import 'package:flutter/material.dart';

import '../../utils/constants/app_strings.dart';

class InputPasswordTextField extends StatelessWidget {
  const InputPasswordTextField({
    super.key,
    required this.passwordTEController,
    this.onChanged,
  });

  final TextEditingController passwordTEController;
  final Function(String)? onChanged; // Use a nullable function type

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordTEController,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) return AppString.passwordRequiredText;
        return null;
      },
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: AppString.passwordText),
    );
  }
}
