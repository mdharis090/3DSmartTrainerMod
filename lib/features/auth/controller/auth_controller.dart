
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:transformationtracker/features/auth/controller/auth_state.dart';


final loginProvider =
    StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();


  void togglePassword() {
    state = state.copyWith(
      ispasswordhidden: !state.ispasswordhidden,
    );
  }

  void toggleRemember(bool value) {
    state = state.copyWith(
      isrememberme: value,
    );
  }
}