import 'package:flutter/material.dart';

import '../../../data/services/api_service.dart';
import '../../../utils/helper/app_export.dart';
import '../models/task_model.dart';
import '../models/task_status_count_model.dart';
import '../widgets/create_new_task.dart';
import '../widgets/task_list.dart';
import '../widgets/task_not_found.dart';

class NewTaskView extends StatefulWidget {
  const NewTaskView({super.key});

  @override
  State<NewTaskView> createState() => _NewTaskViewState();
}

class _NewTaskViewState extends State<NewTaskView> {
  final ApiService _apiService = ApiService();

  List<TaskStatusCountModel> _taskStatusCountList = [];

  List<TaskModel> _taskList = [];

  bool isLoading = true;

  @override
  void initState() {
    _taskStatusCountList = [];
    _taskList = [];
    _loadDashboardData();
    super.initState();
  }

  Future<void> _loadDashboardData() async {
    isLoading = true;
    TaskType type = TaskType.values[0];
    setState(() {});
    _taskStatusCountList = await _apiService.fetchTaskStatusCountList();
    _taskList = await _apiService.fetchTaskList(type: type);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 80,
              child: _buildTaskStatusCountList(textTheme),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildTaskList(textTheme))
          ],
        ),
      ),
      floatingActionButton: _taskList.isNotEmpty ? _buildFloatingActionButton() : null,
    );
  }

  Widget _buildTaskStatusCountList(TextTheme textTheme) {
    return isLoading
        ? loading()
        : ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _taskStatusCountList.length,
            itemBuilder: (context, index) {
              TaskStatusCountModel taskStatus = _taskStatusCountList[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(children: [
                    Text(
                      taskStatus.totalCount.toString(),
                      style: textTheme.titleLarge,
                    ),
                    Text(
                      taskStatus.status,
                    ),
                  ]),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 5),
          );
  }

  Widget _buildTaskList(TextTheme textTheme) {
    return isLoading
        ? loading()
        : _taskList.isEmpty
            ? TaskNotFoundWidget(onTap: _addTaskButton, subTitle: 'There is no task')
            : TaskList(taskList: _taskList);
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _addTaskButton,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
    );
  }

  void _addTaskButton() {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => CreateTaskWidget(onClose: _onTappedCloseButton),
    );
  }

  void _onTappedCloseButton() {
    _loadDashboardData();
    setState(() {});
    Navigator.pop(context);
  }
}
