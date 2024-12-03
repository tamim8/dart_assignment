abstract class TaskRepository {
  Future<dynamic> createTask(Map<String, dynamic> body);

  Future<dynamic> fetchTaskList(String type);

  Future<dynamic> fetchTaskStatusCountList();

  Future<dynamic> updateTaskStatus(String id, String status);

  Future<dynamic> deleteTask(String id);
}
