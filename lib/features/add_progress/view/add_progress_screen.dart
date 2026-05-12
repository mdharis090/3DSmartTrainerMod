import 'package:flutter/material.dart';

class AddProgressScreen extends StatelessWidget {
  const AddProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Progress")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              height: 200,
              color: Colors.grey,
              child: const Center(child: Text("Upload Image")),
            ),

            const TextField(
              decoration: InputDecoration(labelText: "Weight"),
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Save Progress"),
            ),
          ],
        ),
      ),
    );
  }
}