import 'package:flutter/material.dart';

import '../../../common/widget/app_background.dart';
import '../../../utils/constants/app_sizes.dart';
import 'widgets/profile_info_form.dart';
import 'widgets/profile_picture.dart';
import 'widgets/update_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      appBar: AppBar(title: const Text('Profile')),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            ProfilePicture(),
            SizedBox(height: AppSizes.lHeight),
            const ProfileInfoForm(),
            SizedBox(height: AppSizes.lHeight),
            const ProfileUpdateButton(),
          ],
        ),
      ),
    );
  }
}
