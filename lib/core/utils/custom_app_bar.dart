
import 'package:flutter/material.dart';
import 'package:transformationtracker/core/constants/app_color.dart';

class CustomRow extends StatelessWidget {
  final String customText;

  const CustomRow({super.key, required this.customText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        // 1. Circular Back Button
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white, // White circular background
              shape: BoxShape.circle,
            ),
            child: const Align(
              alignment: Alignment.topLeft,
            
              child: Icon(
                Icons.chevron_left, // Exactly matches the thin < icon
                color: AppColors.black,
                size: 30
                
                ,
              ),
            ),
          ),
        ),
        
        // 2. Centered Text
        Center(
          child: Text(
            customText,
            style: const TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w600, // Semi-bold style
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}