import 'package:flutter/material.dart';

const arabic = "ar";
const english = "en";

const assetsPathLocalization = "assets/translations";

const arabicLocale = Locale('ar', "SA");
const englishLocale = Locale("en", "US");

enum LanugageType { english, arabic }

extension LanguageTypeEx on LanugageType {
  String getValue() {
    switch (this) {
      case LanugageType.english:
        return english;
      case LanugageType.arabic:
        return arabic;
    }
  }
}
