// import 'package:flutter/material.dart';
// import 'package:transformationtracker/features/onboarding/view/ongoing_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {

//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (_) => const OnboardingScreen()),
//       );
//     });
//   }

// ignore_for_file: use_build_context_synchronously

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const Center(
//         child: Text("Fitness Tracker", style: TextStyle(fontSize: 24)),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/features/splash/controller/splash_screen_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();

    // Listen once for navigation (BEST PRACTICE)
    Future.microtask(() {
      ref.listen(splash, (previous, next) {
        next.whenData((_) {
          context.push('/ongoing'); // replace stack
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(splash); // trigger provider

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center,
              size: 80,
              color: Color(0xFF6C5CE7),
            ),
            const SizedBox(height: 20),
            Text(
              "Transformation Tracker",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}