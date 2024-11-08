import 'package:flutter/material.dart';

import '../../../utils/helper/app_export.dart';

class TaskNotFoundWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String subTitle;

  const TaskNotFoundWidget({
    super.key,
    this.onTap,
    this.subTitle = 'There is no pending task',
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImagePath.taskNotFound),
        Text(
          'No Task',
          style: textTheme.displaySmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subTitle,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: 180,
          child: onTap != null
              ? ElevatedButton(
                  onPressed: onTap,
                  child: const Text('Create new task'),
                )
              : null,
        ),
      ],
    );
  }
}
