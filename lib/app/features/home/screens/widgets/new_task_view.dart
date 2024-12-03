import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/home/controllers/task_controller.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/helper/functions.dart';
import '../../data/models/task_status_count_model.dart';
import 'widgets.dart';

class NewTaskView extends StatelessWidget {
  NewTaskView({super.key});

  final TaskController _controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    _controller.loadTaskList(TaskStatus.newTask);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        if (_controller.isLoading.value) {
          return loading();
        }
        if (_controller.errorMessage.value.isNotEmpty) {
          return Center(child: Text(_controller.errorMessage.value));
        }
        return Column(
          children: [
            const SizedBox(height: 20),
            const TaskStatusCountWidget(),
            const SizedBox(height: 20),
            Expanded(child: _buildTaskList())
          ],
        );
      }),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildTaskList() {
    if (_controller.taskList.isEmpty) {
      return TaskNotFoundWidget(
          onTap: _addTaskButton, subTitle: 'There is no task');
    }
    return TaskList(taskList: _controller.taskList);
  }

  Widget _buildFloatingActionButton() {
    return Obx(() {
      if (_controller.taskList.isEmpty) {
        return const SizedBox.shrink();
      }
      return FloatingActionButton(
        onPressed: _addTaskButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      );
    });
  }

  void _addTaskButton() {
    Get.dialog(CreateTaskWidget());
  }
}
