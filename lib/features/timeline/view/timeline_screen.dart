import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timeline")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return ListTile(
            leading: const Icon(Icons.image),
            title: Text("Day $index"),
            subtitle: const Text("Weight: 70kg"),
          );
        },
      ),
    );
  }
}