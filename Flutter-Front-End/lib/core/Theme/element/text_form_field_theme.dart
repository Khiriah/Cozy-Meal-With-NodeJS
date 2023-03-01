import 'package:cozy/core/Theme/theme.dart';
import 'package:flutter/material.dart';


class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
      fillColor:whiteColor,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      prefixIconColor: orangeColor,
      suffixIconColor: orangeColor,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color:orangeColor)),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: greyColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      filled: true,
      prefixStyle: const TextStyle(color:orangeColor ));
}
