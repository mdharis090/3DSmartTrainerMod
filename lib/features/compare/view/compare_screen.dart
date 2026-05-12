import 'package:flutter/material.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Before & After")),
      body: Center(
        child: Stack(
          children: [

            Row(
              children: [
                Expanded(child: Image.asset("before.jpg")),
                Expanded(child: Image.asset("after.jpg")),
              ],
            ),

            const Center(child: VerticalDivider(thickness: 2)),
          ],
        ),
      ),
    );
  }
}