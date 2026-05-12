import 'package:flutter/material.dart';
import 'package:transformationtracker/features/profile_setup/view/profile_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("assets/onboarding.png"),

          const SizedBox(height: 20),

          const Text(
            "Track Your Transformation",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const Text("See your body change over time"),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileSetupScreen()),
              );
            },
            child: const Text("Get Started"),
          ),
        ],
      ),
    );
  }
}