// enum Status { empty, loading, success, failure }

// class ApiResponse<T> {
//   Status? status;
//   String? message;
//   T? data;
//
//   ApiResponse({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   ApiResponse.loading() : status = Status.loading;
//
//   ApiResponse.completed({required this.data}) : status = Status.success;
//
//   ApiResponse.error({required this.message}) : status = Status.failure;
//
//   @override
//   String toString() {
//     return 'Status: $status  Message: $message Data: $data';
//   }
// }
