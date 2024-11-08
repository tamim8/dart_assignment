import 'package:flutter/material.dart';
import 'package:task_manager/app/data/model/api_response.dart';
import 'package:task_manager/app/features/authentication/models/user_model.dart';
import 'package:task_manager/app/features/home/models/task_model.dart';
import 'package:task_manager/app/features/home/models/task_status_count_model.dart';

import '../../utils/constants/api_constants.dart';
import '../../utils/helper/app_export.dart';
import '../../utils/http/http_client.dart';

class ApiService extends HttpClient {
  /// Do login
  Future<bool> login({required UserModel user}) async {
    try {
      final response = await makePostRequest(
        endpoint: ApiConstants.login,
        body: user.toJsonLoginUser(),
      );
      debugPrint(response.message);
      if (response.status == 'success' && response.token != null) {
        localStorage.write('token', response.token);
        return true;
      } else {
        throw response.message.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  /// -- Do Registration
  Future<UserModel> registration({required UserModel user}) async {
    try {
      final ApiResponse<UserModel> response = await makePostRequest<UserModel>(
        endpoint: ApiConstants.registration,
        body: user.toJson(),
        fromJsonT: (json) => UserModel.fromJson(json),
      );
      if (response.status == 'success' && response.data != null) {
        return response.data!;
      } else {
        throw response.message.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  /// -- Featch user information
  Future<UserModel> getUserInfo() async {
    try {
      final ApiResponse<UserModel> response = await makeGetRequest<UserModel>(
        endpoint: ApiConstants.profileDetails,
        fromJsonT: (json) => UserModel.fromJson(json),
      );
      if (response.status == 'success' && response.data != null) {
        return response.data!;
      } else {
        throw response.message.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  /// -- Update User information
  Future<UserModel> updateUserProfile({required UserModel user}) async {
    try {
      final ApiResponse<UserModel> response = await makePostRequest<UserModel>(
        endpoint: ApiConstants.profileUpdate,
        body: user.toJson(),
        fromJsonT: (json) => UserModel.fromJson(json),
      );
      if (response.status == 'success' && response.data != null) {
        return response.data!;
      } else {
        throw response.message.toString();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> verifyEmail({required String emailId}) async {
    final response = await makeGetRequest(
        endpoint: '${ApiConstants.recoverVerifyEmail}/$emailId');

    if (response.status == 'success') {
      return true;
    }
    return false;
  }

  Future<bool> verifyPin({required String email, required String pin}) async {
    final response = await makeGetRequest(
        endpoint: '${ApiConstants.recoverVerifyOtp}/$email/$pin');

    if (response.status == 'success') {
      return true;
    }
    return false;
  }

  /// -- Reset User Password
  Future<bool> resetPassword({required body}) async {
    final response = await makePostRequest(
      endpoint: ApiConstants.resetPassword,
      body: body,
    );

    if (response.status == 'success' && response.data != null) {
      return true;
    }
    print('Error: ${response.message}');
    return false;
  }

  /// -- Fetch Task List From Server
  Future<List<TaskStatusCountModel>> fetchTaskStatusCountList() async {
    final response = await makeGetRequest<List<TaskStatusCountModel>>(
      endpoint: ApiConstants.taskStatusCount,
      fromJsonT: (data) =>
          (data as List).map((e) => TaskStatusCountModel.fromJson(e)).toList(),
    );

    if (response.status == 'success' && response.data != null) {
      return response.data!;
    }
    print('Error: ${response.message}');
    return [];
  }

  /// -- Fetch Task List From Server
  Future<List<TaskModel>> fetchTaskList({required TaskType type}) async {
    final response = await makeGetRequest<List<TaskModel>>(
      endpoint: '${ApiConstants.taskList}/${type.name}',
      fromJsonT: (data) =>
          (data as List).map((e) => TaskModel.fromJson(e)).toList(),
    );

    if (response.status == 'success' && response.data != null) {
      return response.data!;
    }
    print('Error: ${response.message}');
    return [];
  }

  /// -- Create a New Task
  Future<bool> createTask({required body}) async {
    final response = await makePostRequest<TaskModel>(
      endpoint: ApiConstants.createTask,
      body: body,
      fromJsonT: (data) => TaskModel.fromJson(data),
    );

    if (response.status == 'success' && response.data != null) {
      return true;
    }
    print('Error: ${response.message}');
    return false;
  }

  /// -- Update Existing Task Status

  Future<bool> updateTaskStatus(
      {required String id, required String status}) async {
    final response = await makeGetRequest(
        endpoint: '${ApiConstants.updateTaskStatus}/$id/$status');

    if (response.status == 'success') {
      return true;
    }
    return false;
  }

  /// -- Delete Task
  Future<bool> deleteTask({required String id}) async {
    final response =
        await makeGetRequest(endpoint: '${ApiConstants.deleteTask}/$id');

    if (response.status == 'success') {
      return true;
    }
    print('Error: ${response.message}');
    return false;
  }
}
