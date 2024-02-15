import 'package:ecommerce_app_en/consts/color_data.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData themeData(
      {required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
        scaffoldBackgroundColor: isDarkTheme
            ? ColorData.darkScaffoldColor
            : ColorData.lightScaffoldColor,
        primaryColor: isDarkTheme
            ? ColorData.darkPrimaryColor
            : ColorData.lightPrimaryColor,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light);
  }
}
