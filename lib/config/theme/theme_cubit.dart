import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/services/service_locator.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialState);

  final _appCahce = getIt<AppCahce>();

  switchAppThemeMode() async {
    if (await _appCahce.isDarkMode()) {
      _appCahce.setDarkTheme(false);
      emit(ThemeMode.light);
    } else {
      _appCahce.setDarkTheme(true);
      emit(ThemeMode.dark);
    }
  }
}
