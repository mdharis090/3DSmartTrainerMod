import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/features/auth/view/pages/login_page.dart';
import 'package:transformationtracker/features/dashborad/view/dashborad_screen.dart';
import 'package:transformationtracker/features/forget_password/view/forgetpassword.dart';
import 'package:transformationtracker/features/onboarding/view/ongoing_screen.dart';
import 'package:transformationtracker/features/personal_name/view/chose_your_goal.dart';
import 'package:transformationtracker/features/personal_name/view/personal_deatil_screen.dart';
import 'package:transformationtracker/features/profile_setup/view/profile_screen.dart';
import 'package:transformationtracker/features/singup/view/singup_screen.dart';
import 'package:transformationtracker/features/splash/view/splash_screen.dart';
import 'package:transformationtracker/features/verfication/view/resest_screen.dart';
import 'package:transformationtracker/features/verfication/view/verfication_screen.dart';

/// Route name constants — avoids typo bugs
class Routes {
  Routes._();
  static const String splash = '/splash';
  static const String auth = "/login";
  //static const String ongoing    = '/ongoing';
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
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/ongoing',
        name: 'ongoing',
        builder: (context, state) => const OngoingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScrren(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SingupScreen(),
      ),
      GoRoute(
        path: '/forgetpassword',
        name: 'forgetpassword',
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: '/reset',
        name: 'reset',
        builder: (context, state) => const verficationScreen(),
      ),
      GoRoute(
        path: '/restscreen',
        name: 'resest',
        builder: (context, state) => const ResestScreen(),
      ),
      GoRoute(
        path: '/personalDeatil',
        name: 'personalDeatil',
        builder: (context, state) => const PersonalDetaileScreen(),
      ),
      GoRoute(
        path: '/slectgoal',
        name: 'slectgoal',
        builder: (context, state) => const GoalSlectionScreen(),
      ),
      GoRoute(
        path: '/dashborad',
        name: 'Dashborad',
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('404 — ${state.error}'))),
  );

  /// Auth guard — redirect unauthenticated users to login
  static String? _guard(BuildContext context, GoRouterState state) {
    return null; // no redirect
  }
}
