
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../controller/image_picker_controller.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key});

  final ImagePickerController _controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Obx(
            () => Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.primary, width: 2)),
              child: _controller.imageBytes.value != null
                  ? _buildImage()
                  : const Icon(Icons.person_outlined, size: 100, color: Colors.grey),
            ),
          ),
          buildEditButton(),
        ],
      ),
    );
  }

  Widget buildEditButton() {
    return Positioned(
      bottom: 4,
      right: 4,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(50), // Image radius
        child: Obx(() {
          // Display the image
          return Image.memory(
            _controller.imageBytes.value!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          );
        }),
      ),
    );
  }

  void _onTap() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Image',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _imagePickButton(
                    label: 'Gallery',
                    icon: Icons.image_outlined,
                    onTap: () {
                      _controller.pickImageFromGallery();
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                  _imagePickButton(
                    label: 'Camera',
                    icon: Icons.camera_alt_outlined,
                    onTap: () {
                      _controller.pickImageFromCamera();
                      Get.back(); // Close the bottom sheet
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagePickButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 80),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
