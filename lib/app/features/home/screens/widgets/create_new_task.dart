import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/utils/helper/snack_bar.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/helper/functions.dart';
import '../../controllers/task_controller.dart';

class CreateTaskWidget extends StatelessWidget {
  CreateTaskWidget({super.key});

  final _controller = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.close)),
                  const SizedBox(width: 10),
                  const Text(
                    'Add New Task',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TextFormField(
                        controller: _controller.titleTController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.titleRequiredText;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(label: Text('Title')),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        maxLines: 5,
                        controller: _controller.descriptionTController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.descriptionRequiredText;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          label: Text('Description'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Obx(
                        () => ElevatedButton(
                          // onPressed: _createNewTaskButton,
                          onPressed: () async {
                            final isSuccess = await _controller.createNewTask();
                            if (isSuccess) {
                              AppSnackBar.success(
                                  message: 'New Task Created Successfully');
                            } else {
                              AppSnackBar.error(
                                  title: 'Error',message:  'Failed to Create Task');
                            }
                          },
                          child: _controller.isLoading.value
                              ? buttonLoading()
                              : const Text('Add'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//   void _createNewTaskButton() {
//     final isSuccess = _controller.createNewTask();
//     if (isSuccess) {
//       AppSnackBar.success(context, message)
//     }
//   }
}
