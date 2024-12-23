import 'package:flutter/material.dart';

import '../../features/common/widget/app_alert_dialog.dart';
import '../constants/app_colors.dart';

extension EmailValidator on String {
  bool get isValidEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

Widget loading() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
      // strokeWidth: 2,
    ),
  );
}

Widget buttonLoading() {
  return const SizedBox(
    width: 24,
    height: 24,
    child: CircularProgressIndicator(
      color: Colors.white,
      strokeWidth: 2,
    ),
  );
}

void deleteDialog({
  required VoidCallback onConfirm,
  String? message,
}) {
  GenericAlertDialog.show(
    title: 'Delete Confirmation',
    message: message ?? 'Are you sure you want to Delete this task?',
    confirmText: 'Delete',
    cancelText: 'Cancel',
    onConfirm: onConfirm,
    onCancel: () {
      // Handle cancel action
    },
  );
}
