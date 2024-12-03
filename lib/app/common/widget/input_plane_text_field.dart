import 'package:flutter/material.dart';

class InputPlaneTextField extends StatelessWidget {
  const InputPlaneTextField({
    super.key,
    required this.tEController,
    this.label = 'label',
    this.errorMessage = 'This field is required!',
  });

  final String label;
  final String errorMessage;
  final TextEditingController tEController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tEController,
      validator: (value) {
        if (value!.isEmpty) return errorMessage;
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(labelText: label),
    );
  }
}
