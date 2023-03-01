import 'package:flutter/material.dart';
import '../theme.dart';

class CustomTextTheme {
  static const textColorLight = blackColor;

  static TextTheme get textThemeLight {
    return textTheme(textColor: textColorLight);
  }

  static TextTheme textTheme({required Color textColor}) {
    const FontWeight bold = FontWeight.w700;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return TextTheme(
      headlineMedium: const TextStyle(
        fontFamily: 'Din',
        color: blackColor,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      displayLarge: const TextStyle(
        fontFamily: 'Din',
        color: whiteColor,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      bodyLarge: const TextStyle(
        fontFamily: 'Din',
        color: orangeColor,
        fontSize: 20,
        fontWeight: bold,
        letterSpacing: 0.0,
      ),
      headlineSmall: const TextStyle(
        fontFamily: 'Din',
        color: blackColor,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      displayMedium: const TextStyle(
        fontFamily: 'Din',
        color: whiteColor,
        fontSize: 24,
        fontWeight: bold,
        letterSpacing: 0.0,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'Din',
        color: greyColor,
        fontSize: 14,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Din',
        color: textColor,
        fontSize: 16,
        fontWeight: medium,
        letterSpacing: 0.0,
      ),
      labelMedium: const TextStyle(
        fontFamily: 'Din',
        color: greyColor,
        fontSize: 12,
        fontWeight: regular,
        decoration: TextDecoration.underline,
        letterSpacing: 0.0,
      ),
      bodySmall: const TextStyle(
        fontFamily: 'Din',
        color: blackColor,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      labelSmall: const TextStyle(
        fontFamily: 'Din',
        color: orangeColor,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      displaySmall: const TextStyle(
        fontFamily: 'Din',
        color: blackColor,
        fontSize: 20,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      titleLarge: const TextStyle(
        fontFamily: 'Din',
        color: blackColor,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      titleMedium: const TextStyle(
        fontFamily: 'Din',
        color: orangeColor,
        fontSize: 15,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      titleSmall: const TextStyle(
        fontFamily: 'Din',
        color: orangeColor,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
    );
  }
}

