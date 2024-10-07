import 'package:flick_pulse/constant/color_constant.dart';
import 'package:flutter/material.dart';

class AppThemeConstant {
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: ColorConstant.primaryColor,
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        color: ColorConstant.fourthColor,
      ),
      bodyMedium: TextStyle(
        color: ColorConstant.fourthColor,
      ),
      bodySmall: TextStyle(
        color: ColorConstant.fourthColor,
      ),
      titleMedium: TextStyle(
        color: ColorConstant.fourthColor,
      ),
    ),
  );
}
