import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/home/data/models/task_model.dart';

import '../../../../utils/helper/functions.dart';
import '../../../../utils/helper/snack_bar.dart';
import '../../controllers/task_controller.dart';
import '../../data/models/task_status_count_model.dart';

class TaskDeleteAndEditButton extends StatelessWidget {
  TaskDeleteAndEditButton({
    super.key,
    required this.task,
  });

  final TaskModel task;
  final TaskController _controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return OverflowBar(
      children: [
        IconButton(
          onPressed: _onTapEditButton,
          icon: const Icon(Icons.edit),
        ),
        IconButton(
            onPressed: _onTapDeleteButton,
            icon: const Icon(Icons.delete_forever)),
      ],
    );
  }

  // Method to show the dialog for selecting a task status
  void _onTapEditButton() {
    Get.dialog(
      AlertDialog(
        title: const Text('Update Task Status'),
        content: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: TaskStatus.values.length,
          itemBuilder: (BuildContext context, int index) {
            TaskStatus status = TaskStatus.values[index];

            return ListTile(
              title: Text(status.name.capitalizeFirst!),
              // Display human-readable status
              leading: Radio<TaskStatus>(
                value: status,
                groupValue: task.status,
                // Bind the groupValue to the task's status
                onChanged: onUpdateTask,
              ),
            );
          },
        ),
      ),
    );
  }

  void onUpdateTask(newValue) {
    if (newValue != null) {
      try{
        _controller.updateTaskStatus(id: task.id, status: newValue);
        Get.back(); // Close the dialog
        AppSnackBar.success(message: 'Task status updated');
      }catch(e){
        Get.back(); // Close the dialog
        AppSnackBar.error(
            title: 'Error', message: _controller.errorMessage.value);
      }

    }
  }

  void _onTapDeleteButton() {
    deleteDialog(
      onConfirm: () async {
        _controller.deleteTask(id: task.id).then((value) {
          if (value) {
            AppSnackBar.success(message: 'Delete task successfully');
          } else {
            AppSnackBar.error(
                title: 'Error', message: _controller.errorMessage.value);
          }
        });
      },
    );
  }
}
