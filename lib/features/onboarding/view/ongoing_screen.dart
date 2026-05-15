import 'package:flutter/material.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
class OngoingScreen extends StatelessWidget {
  const OngoingScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
  children: [
    // Background Image
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ),

    // Dark overlay
    Container(
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.6),
    ),
   
    // Content
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Spacer(),
        const Center(
          child: Text(
            "TrainUp",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Center(child: Image(image: AssetImage('assets/icon.png'),
        color: AppColors.background1,
        )), 
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
          
            style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.background1,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => LoginScreen(),
              //   ),
              // );
            },
            child: const Text("Get Started",style: TextStyle(color: AppColors.black,fontSize: 18),),
          ),
        ),
      ],
    )
  ],
),
    );
  }
}