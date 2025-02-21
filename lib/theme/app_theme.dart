import 'package:flutter/material.dart';

class ThemeColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color textColor;
  final Color subTextColor;
  final Color buttonTxtColor;
  // final Color buttonColor;
  // final Color paymentButtonColor;
  // final Color buttonGradientColor;
  final Color buttonDisableColor;
  final Color hintColor;
  final Color bgTextFieldColor;
  // final Color borderColor;
  // final Color disableColor;
  // final Color dropDownTextColor;
  // final Color logoutTextColor;

  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.textColor,
    required this.subTextColor,
    required this.buttonTxtColor,
    // required this.buttonColor,
    // required this.paymentButtonColor,
    // required this.buttonGradientColor,
    required this.buttonDisableColor,
    required this.hintColor,
    required this.bgTextFieldColor,
    // required this.borderColor,
    // required this.disableColor,
    // required this.dropDownTextColor,
    // required this.logoutTextColor,
  });

  factory ThemeColors.light() {
    return ThemeColors(
      primary: const Color(0xFFFE0000),
      secondary: const Color(0xFF000000),
      background: const Color(0xFFFFFFFF),
      textColor: const Color(0xFF000000),
      subTextColor: const Color(0xFF6C6B6A),
      buttonTxtColor: const Color(0xFFFFFFFF),
      // buttonColor: const Color(0xFFFF5726),
      // paymentButtonColor: const Color(0xFF4D5DFA),
      // buttonGradientColor: const Color(0xFFFF7A53),
      buttonDisableColor: const Color(0xFFFF9999),
      hintColor: const Color(0xFF6C6B6A),
      bgTextFieldColor: const Color(0xFFF0F0F0),
      // borderColor: const Color(0xFFEEEEEE),
      // disableColor: const Color(0xFF6D79EA),
      // dropDownTextColor: const Color(0xFF2D2D3C),
      // logoutTextColor: const Color(0xFFF75555),
    );
  }

  factory ThemeColors.dark() {
    return ThemeColors(
      primary: const Color(0xFFFE0000),
      secondary: const Color(0xFF6C6B6A),
      background: const Color(0xFF505050),
      textColor: const Color(0xFFFFFFFF),
      subTextColor: const Color(0xFFE0E0E0),
      buttonTxtColor: const Color(0xFFFFFFFF),
      // buttonColor: const Color(0xFF4D5DFA),
      // paymentButtonColor: const Color(0xFFFF5726),
      // buttonGradientColor: const Color(0xFF7784FF),
      buttonDisableColor: const Color(0xFFFF9999),
      hintColor: const Color(0xFF6C6B6A),
      bgTextFieldColor: const Color(0xFF404040),
      // borderColor: const Color(0xFF35383F),
      // disableColor: const Color(0xFF6D79EA),
      // dropDownTextColor: const Color(0xFFBDBDBD),
      // logoutTextColor: const Color(0xFFF75555),
    );
  }
}

class AppTheme {
  const AppTheme._();

  static final ThemeColors _lightColors = ThemeColors.light();
  static final ThemeColors _darkColors = ThemeColors.dark();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Outfit',
    scaffoldBackgroundColor: _lightColors.background,
    colorScheme: ColorScheme.light(
      primary: _lightColors.primary,
      secondary: _lightColors.secondary,
      surface: _lightColors.background,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Outfit',
    scaffoldBackgroundColor: _darkColors.background,
    colorScheme: ColorScheme.dark(
      primary: _darkColors.primary,
      secondary: _darkColors.secondary,
      surface: _darkColors.background,
    ),
  );
}