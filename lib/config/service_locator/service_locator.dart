import 'package:coffee_now/config/language/language_cubit.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:coffee_now/features/notifications/data/messaging/api_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service_locator.dart';

final getIt = GetIt.instance;

Future<void> serviceLocatorStart() async {
  await setupAppService();
  await setupAppTheme();
  setupAuthService();
}

Future<void> setupAppService() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<AppCahce>(() => AppCacheImpl(sharedPreferences));
  getIt.registerLazySingleton<LanguageCubit>(() => LanguageCubit());
}

Future<void> setupAppTheme() async {
  final isDarkMode = await getIt<AppCahce>().isDarkMode();
  getIt.registerFactory<ThemeCubit>(
      () => ThemeCubit(isDarkMode ? ThemeMode.dark : ThemeMode.light));
}

setupNotification() {
  getIt.registerLazySingleton<APIMessagingService>(
      () => APIMessagingServiceImpl());
}
