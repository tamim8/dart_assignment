class TaskStatusCountModel {
  final String status;
  final int totalCount;

  TaskStatusCountModel({required this.status, this.totalCount = 0});

  factory TaskStatusCountModel.fromJson(Map<String, dynamic> json) => TaskStatusCountModel(
        status: json["_id"] ?? "",
        totalCount: json["sum"] ?? 0,
      );
}
