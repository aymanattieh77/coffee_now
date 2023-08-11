import 'package:coffee_now/features/auth/presentaion/controllers/otp_vertification/otp_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/reset_password/reset_password_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:coffee_now/features/auth/data/remote/auth/auth_service.dart';
import 'package:coffee_now/features/auth/data/remote/auth/auth_service_impl.dart';
import 'package:coffee_now/features/auth/data/repository/auth_repository_impl.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:coffee_now/features/auth/domain/usecases/auth_usecases.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/register/register_bloc.dart';

void setupAuthService() {
  getIt.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(getIt<AuthService>()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
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

setupResetPasswordBloc() {
  if (!GetIt.I.isRegistered<ResetPasswordBloc>()) {
    getIt.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(getIt()),
    );
    getIt.registerFactory<ResetPasswordBloc>(
      () => ResetPasswordBloc(getIt()),
    );
  }
}

setupVerfiyPhone() {
  if (!GetIt.I.isRegistered<OTPBloc>()) {
    getIt.registerLazySingleton<VertifyPhoneUsecase>(
      () => VertifyPhoneUsecase(getIt()),
    );
    getIt.registerFactory<OTPBloc>(
      () => OTPBloc(getIt()),
    );
  }
}
