import 'package:ecommerce_getx/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/app_sizes.dart';
import '../../../utils/constants/app_strings.dart';

import '../controller/auth_controller.dart';
import 'widgets/app_logo_widget.dart';
import 'widgets/form_header.dart';
import 'widgets/input_pin_form.dart';
import 'widgets/verification_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController lastTEController = TextEditingController();
  TextEditingController mobileNoTEController = TextEditingController();
  TextEditingController cityTEController = TextEditingController();
  TextEditingController addressTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogoWidget(),
                SizedBox(height: AppSizes.xl),
                const FormHeader(
                  title: AppString.profileScreenTitleText,
                  subTitle: AppString.profileScreenSubTitleText,
                ),
                SizedBox(height: AppSizes.xl),
                _buildFirstNameField(),
                SizedBox(height: AppSizes.m),
                _buildLastNameField(),
                SizedBox(height: AppSizes.m),
                _buildMobileNumberField(),
                SizedBox(height: AppSizes.m),
                _buildCityField(),
                SizedBox(height: AppSizes.m),
                _buildAddressField(),
                SizedBox(height: AppSizes.xl),
                ElevatedButton(onPressed: (){}, child: const Text('Complete'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      controller: firstNameTEController,
      validator: (value) {
        if (value!.isEmpty) return 'First Name is required';
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(labelText: AppString.firstNameText),
    );
  }

  Widget _buildLastNameField() {
    return TextFormField(
      controller: lastTEController,
      validator: (value) {
        if (value!.isEmpty) return 'Last Name is required';
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(labelText: AppString.lastNameText),
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: mobileNoTEController,
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty || value.length < 10) return 'Please input a valid mobile no';
        return null;
      },
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: AppString.mobileText,
        prefixText: '+880',
      ),
    );
  }

  Widget _buildCityField() {
    return TextFormField(
      controller: cityTEController,
      validator: (value) {
        if (value!.isEmpty) return 'City is required';
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(labelText: AppString.cityText),
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: addressTEController,
      validator: (value) {
        if (value!.isEmpty) return 'Address is required';
        return null;
      },
      maxLines: 4,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: AppString.shippingAddressText,
        alignLabelWithHint: true,
      ),
    );
  }
}
