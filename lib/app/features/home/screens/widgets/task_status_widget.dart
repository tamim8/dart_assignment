import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/task_controller.dart';
import '../../data/models/task_status_count_model.dart';

class TaskStatusCountWidget extends StatelessWidget {
  const TaskStatusCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: TaskStatus.values.length,
        itemBuilder: (context, index) {
          return _buildStatus(index);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }Widget _buildStatus(int index) {
    final TaskStatus status = TaskStatus.values[index];
    final TaskController taskController = Get.find<TaskController>();

    // Provide a default TaskStatusCountModel when no match is found
    final TaskStatusCountModel taskStatusCountModel = taskController.taskStatusCountList
        .firstWhere(
          (model) => model.status == status,
      orElse: () => TaskStatusCountModel(status: status, totalCount: 0),
    );

    final int taskStatusCount = taskStatusCountModel.totalCount;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            '$taskStatusCount',
            style: const TextStyle(fontSize: 20),
          ),
          Text(statusToString(status)),
        ],
      ),
    );
  }


}
