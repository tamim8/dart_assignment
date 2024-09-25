import 'package:flutter/material.dart';
import 'package:task_manager/app/common/widget/app_background.dart';
import 'package:task_manager/app/utils/constants/app_strings.dart';

import '../../../utils/constants/app_sizes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.loginTitle,
                  style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700, fontSize: 24),
                ),
                SizedBox(height: AppSizes.lVerticalSpace),
                TextFormField(
                  decoration: const InputDecoration(label: Text(AppString.email)),
                ),
                SizedBox(height: AppSizes.lVerticalSpace),
                TextFormField(
                  decoration: const InputDecoration(label: Text(AppString.password)),
                ),
                SizedBox(height: AppSizes.lVerticalSpace),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.chevron_right_outlined,
                    size: 30,
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
