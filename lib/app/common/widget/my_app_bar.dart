import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_manager/app/features/authentication/models/user_model.dart';
import 'package:task_manager/app/features/authentication/screens/sign_in_screen.dart';

import '../../data/services/api_service.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../utils/helper/app_export.dart';
import 'app_alert_dialog.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;

  const MyAppBar({
    super.key,
    required this.context,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  final ApiService apiService = ApiService();
  GetStorage storage = GetStorage();
  UserModel user = UserModel();
  @override
  void initState() {
    _updateProfileBtn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: ListTile(
        onTap: () =>
            _onTapProfileImage(), // Fix: Function reference instead of calling
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(ImagePath.userImage),
        ),
        title: Text(user.firstName!),
        subtitle: Text(user.email!),
      ),
      actions: [
        IconButton(
          onPressed: _onPressedLogoutButton,
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  _onPressedLogoutButton() {
    GenericAlertDialog.show(
      widget.context,
      title: 'Logout Confirmation',
      message: 'Are you sure you want to logout?',
      confirmText: 'Logout',
      cancelText: 'Cancel',
      onConfirm: () {
        storage.erase();
        AppNavigator.pushAndRemoveUntil(
          context: widget.context,
          screen: const SignInScreen(),
        );
      },
      onCancel: () {
        // Handle cancel action
      },
    );
  }

  void _onTapProfileImage() {
    AppNavigator.push(context: widget.context, screen: const ProfileScreen());
  }

  _updateProfileBtn() async {
    user = await apiService.getUserInfo();
    storage.write('userName', '${user.firstName} ${user.lastName}');
    storage.write('firstName', user.firstName);
    storage.write('lastName', user.lastName);
    storage.write('mobile', user.mobile);
    storage.write('password', user.password);
    setState(() {});
  }
}
