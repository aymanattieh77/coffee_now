import 'package:coffee_now/config/language/language_cubit.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:coffee_now/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:coffee_now/features/auth/data/remote/auth/auth_service.dart';
import 'package:coffee_now/features/auth/data/remote/auth/auth_service_impl.dart';
import 'package:coffee_now/features/auth/data/repository/auth_repository_impl.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:coffee_now/features/auth/domain/usecases/facebook_sign_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/google_sign_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/login_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/register_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/veritfy_phone_usecase.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  getIt.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(isDarkMode ? ThemeMode.dark : ThemeMode.light));
}

void setupAuthService() {
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt<AuthService>()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
}

setupAuthUsecases() {
  getIt.registerLazySingleton<ResetPasswordUsecase>(
    () => ResetPasswordUsecase(getIt()),
  );
  getIt.registerLazySingleton<VertifyPhoneUsecase>(
    () => VertifyPhoneUsecase(getIt()),
  );
}

setupRegisterBloc() {
  if (!GetIt.I.isRegistered<RegisterBloc>()) {
    getIt.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(getIt()),
    );
    getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(getIt()),
    );
  }
}

setupLoginBloc() {
  if (!GetIt.I.isRegistered<LoginBloc>()) {
    getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(getIt()),
    );
    getIt.registerLazySingleton<GoogleSignUsecase>(
      () => GoogleSignUsecase(getIt()),
    );
    getIt.registerLazySingleton<FacebookSignUsecase>(
      () => FacebookSignUsecase(getIt()),
    );
    getIt.registerFactory<LoginBloc>(
      () => LoginBloc(getIt(), getIt(), getIt()),
    );
  }
}
