/// Base exception — every feature-specific exception extends this
class AppException implements Exception {
  final String message;
  final int?   statusCode;
  const AppException({required this.message, this.statusCode});

  @override
  String toString() => 'AppException($statusCode): $message';
}

class ServerException    extends AppException {
  const ServerException({required super.message, super.statusCode});
}

class NetworkException   extends AppException {
  const NetworkException({required super.message});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({required super.message});
}

class CacheException     extends AppException {
  const CacheException({required super.message});
}

class NotFoundException  extends AppException {
  const NotFoundException({required super.message});
}
