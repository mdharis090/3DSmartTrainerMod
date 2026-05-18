import 'package:flutter/material.dart';

class DualButtonRow extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onContinue;

  const DualButtonRow({
    super.key,
    required this.onCancel,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: GestureDetector(
            onTap: onCancel,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Continue Button
        Expanded(
          child: GestureDetector(
            onTap: onContinue,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFB6FF3B), // green like image
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}