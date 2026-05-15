import 'package:dio/dio.dart';
import 'package:transformationtracker/core/network/dio_client.dart';
import 'package:transformationtracker/core/error/app_error.dart';


/// Thin wrapper around Dio that returns AppResult<T> instead of throwing.
/// Controllers call this — never call Dio directly from a controller.
class ApiClient {
  final Dio _dio = DioClient().dio;

  Future<AppResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParams,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return AppSuccess(fromJson(res.data));
    } on DioException catch (e) {
      final ex = dioToAppException(e);
      return AppFailure(message: ex.message, statusCode: ex.statusCode);
    }
  }

  Future<AppResult<T>> post<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.post(path, data: body);
      return AppSuccess(fromJson(res.data));
    } on DioException catch (e) {
      final ex = dioToAppException(e);
      return AppFailure(message: ex.message, statusCode: ex.statusCode);
    }
  }

  Future<AppResult<T>> put<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.put(path, data: body);
      return AppSuccess(fromJson(res.data));
    } on DioException catch (e) {
      final ex = dioToAppException(e);
      return AppFailure(message: ex.message, statusCode: ex.statusCode);
    }
  }

  Future<AppResult<void>> delete(String path) async {
    try {
      await _dio.delete(path);
      return const AppSuccess(null);
    } on DioException catch (e) {
      final ex = dioToAppException(e);
      return AppFailure(message: ex.message, statusCode: ex.statusCode);
    }
  }
}
