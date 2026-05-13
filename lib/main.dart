import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transformationtracker/core/constants/app_constants.dart';
import 'package:transformationtracker/core/di/injection.dart';
import 'package:transformationtracker/core/router/app_router.dart';
import 'package:transformationtracker/core/storage/storage_service.dart';
import 'package:transformationtracker/core/theme/app_themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await StorageService().init();   // init secure + regular storage
  await setupDependencies();       // register all GetIt dependencies

  runApp(
    const ProviderScope(           // wraps entire app for Riverpod
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title:                    AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme:                    AppTheme.darkTheme,
      themeMode:                ThemeMode.dark,
      routerConfig:             AppRouter.router,
    );
  }
}
