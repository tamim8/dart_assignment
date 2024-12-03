import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    required this.title,
    this.subTitle = '',
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        Text(
          subTitle,
          style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
