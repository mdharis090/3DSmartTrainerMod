import 'package:flutter/material.dart';
import 'package:transformationtracker/features/dashborad/view/dashborad_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Setup")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(decoration: InputDecoration(labelText: "Name")),
            TextField(decoration: InputDecoration(labelText: "Age")),
            TextField(decoration: InputDecoration(labelText: "Weight")),
            TextField(decoration: InputDecoration(labelText: "Height")),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _goalCard("Weight Loss")),
                const SizedBox(width: 10),
                Expanded(child: _goalCard("Muscle Gain")),
              ],
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
              child: const Text("Start Journey"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _goalCard(String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade800,
      ),
      child: Center(child: Text(title)),
    );
  }
}