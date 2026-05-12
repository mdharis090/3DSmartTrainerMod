import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../error/app_exception.dart';
import '../utils/app_logger.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  DioClient._internal();

  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl:        AppConstants.baseUrl,
      connectTimeout: const Duration(seconds: AppConstants.timeoutSec),
      receiveTimeout: const Duration(seconds: AppConstants.timeoutSec),
      headers: {
        'Content-Type': 'application/json',
        'Accept':       'application/json',
      },
    ),
  )..interceptors.addAll([
      _AuthInterceptor(),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          AppLogger.info('→ ${options.method} ${options.path}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          AppLogger.info('← ${response.statusCode} ${response.requestOptions.path}');
          handler.next(response);
        },
        onError: (err, handler) {
          AppLogger.error('✗ ${err.response?.statusCode} ${err.requestOptions.path}');
          handler.next(err);
        },
      ),
    ]);

  Dio get dio => _dio;

  /// Convenience: adds/updates the Authorization header globally
  void setAuthToken(String token) =>
      _dio.options.headers['Authorization'] = 'Bearer $token';

  void clearAuthToken() =>
      _dio.options.headers.remove('Authorization');
}

// ── Converts DioException → AppException ────────────────
AppException dioToAppException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return const NetworkException(message: 'Connection timed out');
    case DioExceptionType.connectionError:
      return const NetworkException(message: 'No internet connection');
    default:
      final code = e.response?.statusCode;
      final msg  = e.response?.data?['message']
          ?? e.response?.data?['error']
          ?? e.message
          ?? 'Unknown server error';
      if (code == 401) return UnauthorizedException(message: msg.toString());
      if (code == 404) return NotFoundException(message: msg.toString());
      return ServerException(message: msg.toString(), statusCode: code);
  }
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Token is set globally via DioClient.setAuthToken().
    // Override per-request if needed:
    // options.headers['Authorization'] = 'Bearer $customToken';
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // TODO: trigger token refresh or redirect to login
      AppLogger.warning('Unauthorized — redirect to login');
    }
    handler.next(err);
  }
}
