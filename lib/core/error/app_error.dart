/// Simple result wrapper — use instead of throwing exceptions in controllers
sealed class AppResult<T> {
  const AppResult();
}

final class AppSuccess<T> extends AppResult<T> {
  final T data;
  const AppSuccess(this.data);
}

final class AppFailure<T> extends AppResult<T> {
  final String message;
  final int?   statusCode;
  const AppFailure({required this.message, this.statusCode});
}

/// Extension to make working with AppResult ergonomic
extension AppResultX<T> on AppResult<T> {
  bool get isSuccess => this is AppSuccess<T>;
  bool get isFailure => this is AppFailure<T>;

  T?      get dataOrNull  => isSuccess ? (this as AppSuccess<T>).data : null;
  String? get errorOrNull => isFailure ? (this as AppFailure<T>).message : null;

  R when<R>({
    required R Function(T data)   success,
    required R Function(String message, int? statusCode) failure,
  }) {
    return switch (this) {
      AppSuccess(:final data)                         => success(data),
      AppFailure(:final message, :final statusCode)   => failure(message, statusCode),
    };
  }
}
