import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
    required this.buttonText,
    required this.description,
    required this.button,
  });

  final VoidCallback button;
  final String buttonText;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: RichText(
        text: TextSpan(
          text: description,
          style: textTheme.titleMedium?.copyWith(color: Colors.black),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = button,
              text: buttonText,
              style: textTheme.titleMedium?.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
