import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/user_model.dart';
import '../../../core/providers/providers.dart';
import '../../../core/error/app_error.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/utils/app_logger.dart';

/// ── Auth State ──────────────────────────────────────────
class AuthState {
  final UserModel? user;
  final bool       isLoading;
  final String?    error;

  const AuthState({this.user, this.isLoading = false, this.error});

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    UserModel? user,
    bool?      isLoading,
    String?    error,
    bool       clearUser  = false,
    bool       clearError = false,
  }) => AuthState(
    user:      clearUser  ? null : user      ?? this.user,
    isLoading: isLoading  ?? this.isLoading,
    error:     clearError ? null : error     ?? this.error,
  );
}

/// ── Auth Controller (Notifier) ──────────────────────────
class AuthController extends Notifier<AuthState> {
  @override
  AuthState build() => const AuthState();

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final api     = ref.read(apiClientProvider);
      final result  = await api.post<UserModel>(
        '/auth/login',                      // 👈 replace with your endpoint
        body: {'email': email, 'password': password},
        fromJson: (json) => UserModel.fromJson(json['user']),
      );

      return result.when(
        success: (user) {
          // Save token
          final storage = ref.read(storageServiceProvider);
          // storage.setSecure(AppConstants.tokenKey, json['token']);
          DioClient().setAuthToken('your_token_here'); // replace with actual token from response
          state = state.copyWith(user: user, isLoading: false);
          AppLogger.info('Login success: ${user.email}');
          return true;
        },
        failure: (msg, code) {
          state = state.copyWith(isLoading: false, error: msg);
          AppLogger.error('Login failed: $msg');
          return false;
        },
      );
    } catch (e, st) {
      state = state.copyWith(isLoading: false, error: e.toString());
      AppLogger.error('Login error', e, st);
      return false;
    }
  }

  Future<void> logout() async {
    final storage = ref.read(storageServiceProvider);
    await storage.removeSecure(AppConstants.tokenKey);
    DioClient().clearAuthToken();
    state = const AuthState();
    AppLogger.info('User logged out');
  }
}

/// ── Provider ────────────────────────────────────────────
final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);
