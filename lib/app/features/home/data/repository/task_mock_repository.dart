import 'task_repository.dart';

class TaskMockRepository implements TaskRepository {
  @override
  Future createTask(Map<String, dynamic> body) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future fetchTaskList(String type) {
    // TODO: implement fetchTaskList
    throw UnimplementedError();
  }

  @override
  Future fetchTaskStatusCountList() {
    // TODO: implement fetchTaskStatusCountList
    throw UnimplementedError();
  }

  @override
  Future deleteTask(String id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future updateTaskStatus(String id, String status) {
    // TODO: implement updateTaskStatus
    throw UnimplementedError();
  }
}
