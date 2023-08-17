import 'package:coffee_now/core/resources/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/config/language/language_manager.dart';

extension ContextEX on BuildContext {
  bool isArabicLocale() => locale == arabicLocale;
  bool isDark() =>
      Theme.of(this).scaffoldBackgroundColor == AppColor.backgroundDark;
}
