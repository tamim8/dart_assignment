import '../../../../utils/constants/api_constants.dart';
import '../../../../utils/network/api_client.dart';
import '../models/task_model.dart';
import '../models/task_status_count_model.dart';
import 'task_repository.dart';

class TaskApiRepository extends ApiClient implements TaskRepository {
  @override
  Future createTask(Map<String, dynamic> body) async {
    try {
      await postApi(
        endpoint: ApiConstants.createTask,
        body: body,
        fromJson: (json) => TaskModel.fromJson(json),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskModel>> fetchTaskList(String type) async {
    try {
      return await getApi(
        endpoint: '${ApiConstants.taskList}/$type',
        fromJson: (jsonList) =>
            (jsonList as List).map((json) => TaskModel.fromJson(json)).toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TaskStatusCountModel>> fetchTaskStatusCountList() async {
    try {
      return await getApi(
        endpoint: ApiConstants.taskStatusCount,
        fromJson: (jsonList) => (jsonList as List)
            .map((json) => TaskStatusCountModel.fromJson(json))
            .toList(),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteTask(String id) async {
    try {
      await getApi(
          endpoint: '${ApiConstants.deleteTask}/$id', fromJson: (_) {});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateTaskStatus(String id, String status) async {
    try {
      return await getApi(
        endpoint: '${ApiConstants.updateTaskStatus}/$id/$status',
        fromJson: (json) {},
      );
    } catch (e) {
      rethrow;
    }
  }
}
