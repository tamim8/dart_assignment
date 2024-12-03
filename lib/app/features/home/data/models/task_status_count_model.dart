enum TaskStatus { newTask, completed, canceled, progress }

class TaskStatusCountModel {
  final TaskStatus status;
  final int totalCount;

  TaskStatusCountModel({required this.status, this.totalCount = 0});

  factory TaskStatusCountModel.fromJson(Map<String, dynamic> json) =>
      TaskStatusCountModel(
        status: statusFromString(json["_id"]),
        totalCount: json["sum"] ?? 0,
      );
}

// Helper function to convert string status to TaskStatus enum
TaskStatus statusFromString(String status) {
  switch (status.toLowerCase()) {
    case 'new':
      return TaskStatus.newTask;
    case 'completed':
      return TaskStatus.completed;
    case 'progress':
      return TaskStatus.progress;
    case 'canceled':
      return TaskStatus.canceled;
    default:
      throw Exception('Unknown status: $status');
  }
}

// Helper function to convert TaskStatus enum to string for sending to the API
String statusToString(TaskStatus status) {
  switch (status) {
    case TaskStatus.newTask:
      return 'New';
    case TaskStatus.completed:
      return 'Completed';
    case TaskStatus.progress:
      return 'Progress';
    case TaskStatus.canceled:
      return 'Canceled';
  }
}
