import 'package:flutter/material.dart';
import 'package:task_manager/app/features/home/data/models/task_model.dart';
import '../../data/models/task_status_count_model.dart';
import 'task_delete_and_edit_button.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> taskList;
  final Color color;

  const TaskList({super.key, required this.taskList, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80.0),
      scrollDirection: Axis.vertical,
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        TaskModel task = taskList.elementAt(index);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: textTheme.titleLarge),
                Text(task.description),
                Text('Data: ${task.createdDate}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatus(task, textTheme),
                    TaskDeleteAndEditButton(task: task),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 5),
    );
  }

  Widget _buildStatus(TaskModel task, TextTheme textTheme) {
    return Chip(
      label: Text(statusToString(task.status),
          style: textTheme.titleSmall!.copyWith(color: Colors.white)),
      backgroundColor: color
  ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      side: const BorderSide(style: BorderStyle.none),
    );
  }
}
