import 'package:flutter/material.dart';
import 'package:task_manager/app/data/services/api_service.dart';

import '../../../common/widget/app_alert_dialog.dart';
import '../../../utils/helper/app_export.dart';
import '../models/task_model.dart';

class TaskList extends StatefulWidget {
  final List<TaskModel> taskList;
  final Color color;

  const TaskList({super.key, required this.taskList, this.color = Colors.blue});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isLoading = false;
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80.0),
      scrollDirection: Axis.vertical,
      itemCount: widget.taskList.length,
      itemBuilder: (context, index) {
        TaskModel task = widget.taskList.elementAt(index);

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
                    Chip(
                      label: Text(task.status, style: textTheme.titleSmall!.copyWith(color: Colors.white)),
                      backgroundColor: widget.color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      side: const BorderSide(style: BorderStyle.none),
                    ),
                    OverflowBar(
                      children: [
                        IconButton(
                          onPressed: (){},
                          // onPressed: _buildDropDownMenu(task),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                            onPressed: () {
                                 _buildDeleteDialog(context, task);
                            },
                            icon: const Icon(Icons.delete_forever)),
                      ],
                    ),
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

  _buildDeleteDialog(BuildContext context, TaskModel task) {

    GenericAlertDialog.show(
      context,
      title: 'Delete Confirmation',
      message: 'Are you sure you want to Delete this task?',
      confirmText: 'Delete',
      cancelText: 'Cancel',
      onConfirm: () {
        // Handle confirm action
      },
      onCancel: () {
        // Handle cancel action
      },
    );





    // return AppAlertDialog(
    //   context: context,
    //   title: 'Delete Confirmation',
    //   content: 'Are you sure you want to Delete this task?',
    //   onTapCallback: () async {
    //     isLoading = true;
    //
    //     Navigator.of(context).pop();
    //     final isSuccess = await _apiService.deleteTask(id: task.id);
    //
    //     isLoading = false;
    //     if (isSuccess) {
    //       widget.taskList.remove(task);
    //       successToast(msg: 'Success!', context: context);
    //       setState(() {});
    //     } else {
    //       errorToast(msg: 'error!', context: context);
    //       // setState(() {});
    //     }
    //   },
    // );
    // return showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //
    //   },
    // );
  }

  _buildDropDownMenu(TaskModel task) async {
    String? status = await showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(100, 30, 30, 400),
      items: TaskType.values.map((TaskType taskType) {
        return PopupMenuItem<String>(
          value: taskType.name,
          child: Text(taskType.name),
        );
      }).toList(),
    );

    if (status != null) {
      final isSuccess = await _apiService.updateTaskStatus(id: task.id, status: status);
      if (isSuccess) {
        //widget.taskList.remove(task);
        successToast(msg: 'Success!', context: context);
        setState(() {});
      } else {
        errorToast(msg: 'error!', context: context);
        // setState(() {});
      }
    }
  }
}
