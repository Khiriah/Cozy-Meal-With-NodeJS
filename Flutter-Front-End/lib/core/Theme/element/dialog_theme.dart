import 'package:cozy/core/Theme/theme.dart';
import 'package:flutter/material.dart';


class CustomDialogTheme {
  CustomDialogTheme._();
  static DialogTheme lightDialogTheme = const DialogTheme(
    backgroundColor: whiteColor,
    elevation: 0.0,
    alignment: Alignment.center,
    iconColor: orangeColor,
    titleTextStyle: TextStyle(),
    contentTextStyle: TextStyle(),
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(
      bottomLeft: Radius.circular(40),
      topRight: Radius.circular(40),
    )),
  );
}
