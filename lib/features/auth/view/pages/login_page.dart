import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transformationtracker/core/constants/app_color.dart';
import 'package:transformationtracker/features/auth/controller/auth_controller.dart';
import 'package:transformationtracker/features/auth/view/widgets/login_widget.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';

class LoginScrren extends ConsumerStatefulWidget {
  const LoginScrren({super.key});

  @override
  ConsumerState<LoginScrren> createState() => _LoginScrrenState();
}

class _LoginScrrenState extends ConsumerState<LoginScrren> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const SizedBox(height: 50),

              // Title
              Center(
                child: Text(
                  'TrainUp',
                  style: GoogleFonts.inter(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(height: 23),

              // Logo
              Image.asset(
                'assets/icon.png',
                height: 90,
                width: 90,
                color: AppColors.background1,
              ),
              loginTextFields(
                title: 'Email',
                hintText: 'Enter your email',
                controller: notifier.emailController,
              ),

              const SizedBox(height: 20),

              // Password Field
              loginTextFields(
                title: 'Password',
                hintText: 'Enter your password',
                controller: notifier.passwordController,
                isPassword: true,
                obscureText: state.ispasswordhidden,
                onTogglePassword: () => notifier.togglePassword(),
              ),
              const SizedBox(height: 15),

              //               // Remember + Forgot
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: state.isrememberme,
                        onChanged: (v) {
                          notifier.toggleRemember(v ?? false);
                        },
                      ),
                      const Text("Remember Me"),
                    ],
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.black),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              CustomBoxButton(
                text: "Login",
                onTap: () {
                context.push('/signup');
                },
              ),
              const SizedBox(height: 20),

              // Signup
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
