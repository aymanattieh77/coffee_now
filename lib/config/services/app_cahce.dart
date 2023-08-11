import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:coffee_now/config/language/language_manager.dart';

const langKey = "LANGAUGE_KEY";
const darkModeKey = "DARK_KEY";
const userUidKey = "USER_UID_KEY";

abstract class AppCahce {
  Future<String> getCurrentAppLanguage();
  Future<void> changeAppLanguage(LanugageType lanugageType);
  Future<Locale> getLocale();
  Future<bool> isDarkMode();
  Future<void> setDarkTheme(bool isDark);
  Future<void> saveUserUid(String userUid);
  String getUserUid();
}

class AppCacheImpl implements AppCahce {
  final SharedPreferences _prefs;
  AppCacheImpl(this._prefs);
  @override
  Future<void> changeAppLanguage(LanugageType lanugageType) async {
    await _prefs.setString(langKey, lanugageType.getValue());
  }

  @override
  Future<String> getCurrentAppLanguage() async {
    String? language = _prefs.getString(langKey);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanugageType.english.getValue();
    }
  }

  @override
  Future<Locale> getLocale() async {
    String currentLanguage = await getCurrentAppLanguage();
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

  @override
  String getUserUid() {
    return _prefs.getString(userUidKey) ?? "";
  }

  @override
  Future<void> saveUserUid(String userUid) async {
    await _prefs.setString(userUidKey, userUid);
  }
}
