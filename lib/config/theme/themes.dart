import 'package:coffee_now/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundLight,
    primaryColor: AppColor.coffee,
    primaryColorDark: AppColor.black,
    primaryColorLight: AppColor.dark2D,
    dividerColor: AppColor.whiteE9,
    hintColor: AppColor.greyAA,
    cardColor: AppColor.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: AppColor.backgroundLight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColor.white,
        systemNavigationBarColor: AppColor.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundDark,
    primaryColorDark: AppColor.whiteE9,
    primaryColorLight: AppColor.whiteD9,
    primaryColor: AppColor.white,
    dividerColor: AppColor.strokeDark,
    cardColor: AppColor.strokeDark,
    brightness: Brightness.dark,
    hintColor: AppColor.greyAA,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundDark,
      elevation: 0.0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: AppColor.backgroundDark,
        systemNavigationBarColor: AppColor.backgroundDark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
