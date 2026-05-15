import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transformationtracker/core/utils/custom_app_bar.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';
import 'package:transformationtracker/features/auth/controller/auth_controller.dart';
import 'package:transformationtracker/features/auth/view/widgets/login_widget.dart';

class SingupScreen extends ConsumerStatefulWidget {
  const SingupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SingupScreenState();
}

class _SingupScreenState extends ConsumerState<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(loginProvider.notifier);
    // ignore: unused_local_variable
    final state = ref.watch(loginProvider);
    return Scaffold(
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            const CustomRow(customText: "Sign up"),

            const SizedBox(height: 20),

            loginTextFields(
              title: 'Name',
              hintText: 'Enter your name',
              controller: notifier.nameController,
            ),

            const SizedBox(height: 15),

            loginTextFields(
              title: 'Email',
              hintText: 'Enter your email',
              controller: notifier.emailController,
            ),

            const SizedBox(height: 15),

            loginTextFields(
              title: 'Phone',
              hintText: 'Enter your phone',
              controller: notifier.phoneController, 
              isNumber: true,
            ),

            const SizedBox(height: 15),

            loginTextFields(
              title: 'Password',
              hintText: 'Enter your password',
              controller: notifier.passwordController,
              isPassword: true,
              obscureText: state.ispasswordhidden,
              onTogglePassword: () => notifier.togglePassword(),
            ),

            const SizedBox(height: 50),

            CustomBoxButton(
              text: "Sign up",
              onTap: () {},
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  ),
);
  }
}