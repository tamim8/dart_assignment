
class DeleteResponse {
  final String status;
  final Tt data;

  DeleteResponse({
    required this.status,
    required this.data,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResponse(
      status: json["status"],
      data: Tt.fromJson(json["data"]),
    );
  }
}

class Tt {
  final bool acknowledged;
  final int deletedCount;

  Tt({required this.acknowledged, required this.deletedCount});

  factory Tt.fromJson(Map<String, dynamic> json) => Tt(
    acknowledged: json["acknowledged"] as bool, // Directly cast to bool
    deletedCount: json["deletedCount"] as int,   // Directly cast to int
  );
}
