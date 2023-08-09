import 'package:coffee_now/core/resources/colors.dart';
import 'package:flutter/material.dart';

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
  );
}
