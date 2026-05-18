import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';
import 'package:transformationtracker/features/auth/controller/auth_controller.dart';
import 'package:transformationtracker/features/auth/view/widgets/login_widget.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
   @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(loginProvider.notifier);
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
          'Forget Password',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              loginTextFields(
                title: 'Email',
                hintText: 'Enter your email',
                controller: notifier.emailController,
              ),
              
              const Spacer(),

            CustomBoxButton(
              text: "Sign up",
              onTap: () {},
            ),

            const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
