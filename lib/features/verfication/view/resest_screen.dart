import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transformationtracker/core/utils/custom_button.dart';
import 'package:transformationtracker/features/auth/controller/auth_controller.dart';
import 'package:transformationtracker/features/auth/view/widgets/login_widget.dart';

class ResestScreen extends ConsumerStatefulWidget {
  const ResestScreen({super.key});

  @override
  ConsumerState<ResestScreen> createState() => _ResestScreenState();
}

class _ResestScreenState extends ConsumerState<ResestScreen> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(loginProvider.notifier);
    final state = ref.watch(loginProvider);
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
          'Reset password',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                  const SizedBox(
                    height: 20,
                  ),
                  loginTextFields(
                    title: '',
                    hintText: 'Enter your password',
                    controller: notifier.passwordController,
                    isPassword: true,
                    obscureText: state.ispasswordhidden,
                    onTogglePassword: () => notifier.togglePassword(),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                   loginTextFields(
                    title: '',
                    hintText: 'Enter your Confirm password',
                    controller: notifier.passwordController,
                    isPassword: true,
                    obscureText: state.ispasswordhidden,
                    onTogglePassword: () => notifier.togglePassword(),
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
                text: "Continue",
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contine password...')),
                  );
                  context.push('/rest');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}