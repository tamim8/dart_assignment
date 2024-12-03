import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helper/functions.dart';
import '../../controllers/task_controller.dart';
import '../../data/models/task_status_count_model.dart';
import 'task_list.dart';
import 'task_not_found.dart';

class CompletedTaskView extends StatelessWidget {
  const CompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.find<TaskController>();
    controller.loadTaskList(TaskStatus.completed);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx( () {
        if (controller.isLoading.value) {
          return loading();
        }
        if (controller.errorMessage.value.isNotEmpty) {
          return  Center(child: Text(controller.errorMessage.value));
        }
        if (controller.taskList.isEmpty) {
          return const TaskNotFoundWidget(subTitle: 'There is no completed task');
        }
        if (controller.taskList.isNotEmpty) {
          return TaskList(taskList: controller.taskList, color: Colors.green,);
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
