import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../common/widget/my_app_bar.dart';
import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import '../../authentication/models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTEController = TextEditingController();
  TextEditingController _firstNameTEController = TextEditingController();
  TextEditingController _lastNameTEController = TextEditingController();
  TextEditingController _mobileNoTEController = TextEditingController();
  TextEditingController _passwordTEController = TextEditingController();

  final ApiService _apiService = ApiService();
  GetStorage _storage = GetStorage();
  bool isLoading = false;
  @override
  void initState() {
    _emailTEController.text = _storage.read('userEmail');
    _firstNameTEController.text = _storage.read('firstName');
    _lastNameTEController.text = _storage.read('lastName');
    _mobileNoTEController.text = _storage.read('mobile');
    _passwordTEController.text = _storage.read('password');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Profile'),
      ),
      body: AppBackground(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(child: Image.asset(ImagePath.userImage)),
              Container(),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label: Text(AppString.emailText),
                ),
                validator: (value) {
                  if (value!.isEmpty) return AppString.emailAddressRequiredText;
                  if (!value.isValidEmail)
                    return AppString.invalidEmailAddressText;
                  return null;
                },
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              TextFormField(
                controller: _firstNameTEController,
                decoration: const InputDecoration(
                  label: Text(AppString.firstNameText),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'First Name is required';
                  return null;
                },
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              TextFormField(
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  label: Text(AppString.lastNameText),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Last Name is required';
                  return null;
                },
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              TextFormField(
                controller: _mobileNoTEController,
                keyboardType: TextInputType.phone,
                decoration:
                    const InputDecoration(label: Text(AppString.mobileNoText)),
                validator: (value) {
                  if (value!.isEmpty) return 'Mobile No is required';
                  return null;
                },
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              TextFormField(
                controller: _passwordTEController,
                decoration:
                    const InputDecoration(label: Text(AppString.passwordText)),
                validator: (value) {
                  if (value!.isEmpty) return 'Password is required';
                  return null;
                },
              ),
              SizedBox(height: AppSizes.lVerticalSpace),
              ElevatedButton(
                onPressed: isLoading ? null : _updateProfileBtn,
                child: isLoading
                    ? buttonLoading()
                    : const Icon(Icons.chevron_right_outlined, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _updateProfileBtn() async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      UserModel user = UserModel(
        email: _emailTEController.text.trim(),
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        mobile: _mobileNoTEController.text.trim(),
        password: _passwordTEController.text,
      );
      try {
        final updatedUser = await _apiService.updateUserProfile(user: user);
        _storage.write(
            'userName', '${updatedUser.firstName} ${updatedUser.lastName}');
        _storage.write('userEmail', updatedUser.email);
        successToast(msg: 'Success!', context: context);
        setState(() {});
      } catch (e) {
        errorToast(msg: e.toString(), context: context);
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
