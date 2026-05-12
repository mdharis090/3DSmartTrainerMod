class AppConstants {
  AppConstants._();

  static const String appName  = 'My App';                        // 👈 Change
  static const String baseUrl  = 'https://your-api.com/api/v1';  // 👈 Change
  static const int    timeoutSec = 30;

  // Storage keys
  static const String tokenKey     = 'auth_token';
  static const String refreshKey   = 'refresh_token';
  static const String userKey      = 'user_data';
  static const String themeKey     = 'app_theme';
  static const String onboardKey   = 'onboarded';

  // API Endpoints — add yours here
  // static const String loginEndpoint   = '/auth/login';
  // static const String refreshEndpoint = '/auth/refresh';
  // static const String profileEndpoint = '/user/profile';
}
