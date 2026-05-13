// import 'package:flutter/material.dart';
// import 'package:transformationtracker/features/profile_setup/view/profile_screen.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [

//           Image.asset("assets/onboarding.png"),

//           const SizedBox(height: 20),

//           const Text(
//             "Track Your Transformation",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),

//           const SizedBox(height: 10),

//           const Text("See your body change over time"),

//           const SizedBox(height: 30),

//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
//               );
//             },
//             child: const Text("Get Started"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:transformationtracker/features/profile_setup/view/profile_screen.dart';


class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 240,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF6C5CE7), Color(0xFF00CEC9)]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(child: Icon(Icons.timeline, size: 80, color: Colors.white)),
            ),
            const SizedBox(height: 40),
            const Text("Track Your Transformation", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text("See your body change over time", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileSetupScreen())),
              child: const Text("Get Started", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}