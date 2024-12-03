import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/features/home/data/repository/task_repository.dart';

import '../data/models/task_model.dart';
import '../data/models/task_status_count_model.dart';

class TaskController extends GetxController {
  final TaskRepository taskRepo;

  TaskController(this.taskRepo);

  final RxBool isLoading = true.obs;
  late TaskStatus status;
  final RxString errorMessage = ''.obs;
  final RxList<TaskStatusCountModel> taskStatusCountList = <TaskStatusCountModel>[].obs;
  final RxList<TaskModel> taskList = <TaskModel>[].obs;

  final formKey = GlobalKey<FormState>();
  final TextEditingController titleTController = TextEditingController();
  final TextEditingController descriptionTController = TextEditingController();

  Future<void> loadTaskList([TaskStatus? status]) async {
    this.status = status ?? this.status;

    try {
      isLoading(true);
      taskStatusCountList.value = await taskRepo.fetchTaskStatusCountList();
      taskList.value = await taskRepo.fetchTaskList(statusToString(this.status));
      errorMessage('');
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<bool> createNewTask() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading(true);
        final Map<String, String> body = {
          "title": titleTController.text,
          "description": descriptionTController.text,
          "status": "New",
        };
        await taskRepo.createTask(body);
        await loadTaskList();
        titleTController.text = '';
        descriptionTController.text = '';
        errorMessage('');
        return true;
      } catch (e) {
        errorMessage(e.toString());
        return false;
      } finally {
        isLoading(false);
      }
    }
    isLoading(false);
    return false;
  }

  Future<void> updateTaskStatus({required String id, required TaskStatus status}) async {
    try {
      await taskRepo.updateTaskStatus(id, statusToString(status));
      await loadTaskList();
      errorMessage('');
    } catch (e) {
      errorMessage(e.toString());
    }
  }

  Future<bool> deleteTask({required String id}) async {
    try {
      await taskRepo.deleteTask(id);
      await loadTaskList();
      errorMessage('');
      return true;
    } catch (e) {
      errorMessage(e.toString());
      return false;
    }
  }
}
