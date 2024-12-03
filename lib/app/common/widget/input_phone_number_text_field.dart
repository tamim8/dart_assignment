import 'package:flutter/material.dart';

import '../../utils/constants/app_strings.dart';

class InputPhoneNoTextField extends StatelessWidget {
  const InputPhoneNoTextField({super.key, required this.numberTEController});

  final TextEditingController numberTEController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: numberTEController,
      validator: (value) {
        if (value!.isEmpty) return 'Mobile No is required';
        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(labelText: AppString.mobileNoText),
    );
  }
}
