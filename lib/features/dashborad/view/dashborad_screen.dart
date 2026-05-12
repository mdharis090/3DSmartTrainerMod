import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const SizedBox(height: 40),

            const Text("Day 5 of Journey",
                style: TextStyle(fontSize: 18)),

            const SizedBox(height: 20),

            _progressCard(),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _actionBtn(Icons.add, "Add"),
                _actionBtn(Icons.bar_chart, "Stats"),
                _actionBtn(Icons.compare, "Compare"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressCard() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: const Center(
        child: Text("60% Complete", style: TextStyle(fontSize: 22)),
      ),
    );
  }

  Widget _actionBtn(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(child: Icon(icon)),
        const SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}