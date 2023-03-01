import 'package:cozy/core/Theme/element/dialog_theme.dart';
import 'package:cozy/core/Theme/element/elevated_button_theme.dart';
import 'package:cozy/core/Theme/element/outlined_button_theme.dart';
import 'package:cozy/core/Theme/element/text_form_field_theme.dart';
import 'package:cozy/core/Theme/theme.dart';
import 'package:flutter/material.dart';

import 'element/text_theme.dart';

ThemeData LightThemeData() {
  return ThemeData(
    fontFamily: 'Din',
      tabBarTheme:  const TabBarTheme(
          unselectedLabelColor: whiteColor,
          labelColor: orangeColor,
          labelStyle: TextStyle(color: orangeColor),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: whiteColor))
      ),
      backgroundColor: whiteColor,
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(color: orangeColor),
      cardColor: orangeColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: orangeColor,
      textTheme: CustomTextTheme.textThemeLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: orangeColor,
        iconTheme: IconThemeData(color: whiteColor, size: 30),
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: orangeColor,
          size: 24,
        ),
        unselectedIconTheme: IconThemeData(
          color: blackColor,
          size: 24,
        ),
      ),
      dialogTheme:CustomDialogTheme.lightDialogTheme,
      elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
      // timePickerTheme:
  );
}
