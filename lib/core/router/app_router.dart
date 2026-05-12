import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/features/splash/view/splash_screen.dart';

/// Route name constants — avoids typo bugs
class Routes {
  Routes._();
  static const String splash  = '/splash';
 // static const String home    = '/home';
  //static const String login   = '/login';
  // static const String profile = '/profile';
  // static const String detail  = '/detail/:id';
}

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    redirect: _guard,
    routes: [
      GoRoute(
        path: Routes.splash,
        name: 'splash',
        builder: (context, state) => SplashScreen(),
      ),
      // GoRoute(
      //   path: Routes.home,
      //   name: 'home',
      //   builder: (context, state) => const Scaffold(
      //     body: Center(child: Text('🏠 Home')),
      //   ),
      // ),
      // GoRoute(
      //   path: Routes.login,
      //   name: 'login',
      //   builder: (context, state) => const Scaffold(
      //     body: Center(child: Text('🔐 Login')),
      //   ),
      // ),
      // Parameterized route example:
      // GoRoute(
      //   path: '/detail/:id',
      //   name: 'detail',
      //   builder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return DetailPage(id: id);
      //   },
      // ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('404 — ${state.error}')),
    ),
  );

  /// Auth guard — redirect unauthenticated users to login
  static String? _guard(BuildContext context, GoRouterState state) {
    // final isLoggedIn = sl<StorageService>().getSecure(AppConstants.tokenKey) != null;
    // if (!isLoggedIn && state.matchedLocation != Routes.login) return Routes.login;
    return null; // no redirect
  }
}
