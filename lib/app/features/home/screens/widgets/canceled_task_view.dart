import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/helper/functions.dart';
import '../../controllers/task_controller.dart';
import '../../data/models/task_status_count_model.dart';
import 'widgets.dart';

class CanceledTaskView extends StatelessWidget {
  const CanceledTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();
    controller.loadTaskList(TaskStatus.canceled);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx (() {
          if (controller.isLoading.value) {
            return loading();
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return  Center(child: Text(controller.errorMessage.value));
          }
          if (controller.taskList.isEmpty) {
            return const TaskNotFoundWidget(
                subTitle: 'There is no canceled task');
          }
          if (controller.taskList.isNotEmpty) {
            return TaskList(taskList: controller.taskList,color: Colors.red,);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
