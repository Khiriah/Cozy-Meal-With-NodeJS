import 'package:cozy/core/Theme/theme.dart';
import 'package:flutter/material.dart';


class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._();
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          foregroundColor: whiteColor,
          side: const BorderSide(color: greyColor),
          padding: const EdgeInsets.symmetric(vertical: 20)));
}
