import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorStart() async {
  await setupAppService();
  await setupAppTheme();
}

Future<void> setupAppService() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppCahce>(() => AppCacheImpl(sharedPreferences));
}

Future<void> setupAppTheme() async {
  final isDarkMode = await getIt<AppCahce>().isDarkMode();
  getIt.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(isDarkMode ? ThemeMode.dark : ThemeMode.light));
}