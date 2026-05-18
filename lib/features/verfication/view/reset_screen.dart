// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';
import 'package:transformationtracker/features/verfication/controller/reset_provider.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    final canResend = timerState.canResend;
    final remaining = timerState.remainingSeconds;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'verification code',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  "We've Sent You A Code To Rest Your Password",
                  style: TextStyle(fontSize: 16, color: AppColors.text),
                ),
            
                const SizedBox(height: 32),
            
                // Countdown display: "00 - 06 Sec" format
                const SizedBox(height: 32),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    letterSpacing: 24, // spacing between digits
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '------',
                    hintStyle: const TextStyle(letterSpacing: 20),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.05),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.bordergray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.bordergray),
                    ),
                  ),
                ),
               
                const SizedBox(height: 24),
                Row(
                  children: [
                     const Icon(Icons.timer_outlined, color: AppColors.background1),
                    const SizedBox(width: 8),
                    Text(
                      "${remaining.toString().padLeft(2, '0')} - 06 Sec",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.background1,
                      ),
                    ),
                  ],
                ),
        
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        
        //  Verify Button
        CustomBoxButton(
          text: "Verify",
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verifying code...')),
            );
            context.push('/forgetpassword');
          },
        ),

        const SizedBox(height: 12),

        //  Resend Text
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Don't Receive Code ? "),
              GestureDetector(
                onTap: canResend
                    ? () => ref.read(timerProvider.notifier).resendCode()
                    : null,
                child: Text(
                  'Resend',
                  style: TextStyle(
                    color: canResend ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

    );
  }
}
