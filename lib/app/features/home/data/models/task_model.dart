import 'task_status_count_model.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final TaskStatus status; // Now using TaskStatus enum
  final String email;
  final String createdDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.email,
    required this.createdDate,
  });

  // Factory constructor to parse the JSON data and map the status field to TaskStatus enum
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      status: statusFromString(
          json['status']), // Convert string status to TaskStatus enum
      email: json['email'],
      createdDate: json['createdDate'],
    );
  }

  // Method to convert TaskStatus enum to String when sending data to the server or for display
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'status':
          statusToString(status), // Convert TaskStatus enum to string for API
      'email': email,
      'createdDate': createdDate,
    };
  }
}
