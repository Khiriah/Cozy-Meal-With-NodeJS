import 'package:cozy/core/Theme/theme.dart';
import 'package:flutter/material.dart';



class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
            minimumSize: const Size(382, 41),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: whiteColor,
          elevation: 0.4,
          backgroundColor: blackColor,
          // side: const BorderSide(color: blackColor),
          padding: const EdgeInsets.symmetric(vertical: 2)));
}

