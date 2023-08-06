import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffee_now/config/language/language_manager.dart';

const langKey = "LANGAUGE_KEY";
const darkModeKey = "DARK_KEY";

abstract class AppCahce {
  Future<String> getAppLanguage();
  Future<void> changeAppLanguage(LanugageType lanugageType);
  Future<Locale> getLocale();
  Future<bool> isDarkMode();
  Future<void> setDarkTheme(bool isDark);
}

class AppCacheImpl implements AppCahce {
  final SharedPreferences _prefs;
  AppCacheImpl(this._prefs);
  @override
  Future<void> changeAppLanguage(LanugageType lanugageType) async {
    if (lanugageType == LanugageType.english) {
      _prefs.setString(langKey, LanugageType.arabic.getValue());
    } else {
      _prefs.setString(langKey, LanugageType.english.getValue());
    }
  }

  @override
  Future<String> getAppLanguage() async {
    String? language = _prefs.getString(langKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanugageType.english.getValue();
    }
  }

  @override
  Future<Locale> getLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanugageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  @override
  Future<bool> isDarkMode() async {
    return _prefs.getBool(darkModeKey) ?? false;
  }

  @override
  Future<void> setDarkTheme(bool isDark) async {
    await _prefs.setBool(darkModeKey, isDark);
  }
}
