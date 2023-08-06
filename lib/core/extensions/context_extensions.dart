import 'package:coffee_now/config/language/language_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension ContextEX on BuildContext {
  bool isArabicLocale() => locale == arabicLocale;
}
