import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/features/splash/controller/splash_screen_provider.dart';
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
     ref.listen(splash, (previous, next) {
    next.whenData((_) {
      context.goNamed('ongoing'); // better than push for splash
    });
  });
    ref.watch(splash); 
     return const Scaffold(
      backgroundColor: AppColors.background1,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/icon.png')),  
          ],
        ),
      ),
    );
  }
}