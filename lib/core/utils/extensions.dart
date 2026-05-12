import 'package:flutter/material.dart';

extension StringX on String {
  bool   get isValidEmail => RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,}$').hasMatch(this);
  String get capitalize    => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
  String get titleCase     => split(' ').map((w) => w.capitalize).join(' ');
}

extension ContextX on BuildContext {
  ThemeData       get theme       => Theme.of(this);
  ColorScheme     get colors      => Theme.of(this).colorScheme;
  TextTheme       get textTheme   => Theme.of(this).textTheme;
  MediaQueryData  get mediaQuery  => MediaQuery.of(this);
  Size            get screenSize  => MediaQuery.of(this).size;
  double          get screenWidth => MediaQuery.of(this).size.width;
  double          get screenHeight=> MediaQuery.of(this).size.height;

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.error : colors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

extension SizedBoxX on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
