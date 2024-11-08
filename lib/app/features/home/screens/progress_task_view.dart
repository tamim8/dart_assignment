import 'package:flutter/material.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import '../models/task_model.dart';
import '../widgets/task_list.dart';
import '../widgets/task_not_found.dart';

class ProgressTaskView extends StatefulWidget {
  const ProgressTaskView({super.key});

  @override
  State<ProgressTaskView> createState() => _ProgressTaskViewState();
}

class _ProgressTaskViewState extends State<ProgressTaskView> {
  final ApiService _apiService = ApiService();

  List<TaskModel> _taskList = [];
  bool isLoading = true;

  @override
  void initState() {
    _taskList = [];
    _loadTaskList();
    super.initState();
  }

  Future<void> _loadTaskList() async {
    isLoading = true;
    setState(() {});
    _taskList = await _apiService.fetchTaskList(type: TaskType.Progress);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: _buildTaskList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return isLoading
        ? loading()
        : _taskList.isEmpty
            ? const TaskNotFoundWidget(subTitle:  'There is no progress task')
            : TaskList(taskList: _taskList);
  }
}
