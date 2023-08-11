import 'package:coffee_now/config/service_locator/auth_service_locator.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/otp_vertification/otp_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/register/register_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/reset_password/reset_password_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/screens/forget_password_screen.dart';
import 'package:coffee_now/features/auth/presentaion/screens/otp_verification_screen.dart';
import 'package:coffee_now/features/auth/presentaion/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/screens/login_screen.dart';
import 'package:coffee_now/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_now/features/wellcome/presentaion/screens/splash_screen.dart';

abstract class Routes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgetPassword = '/forgetPassword';
  static const home = '/home';
}

abstract class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return AppRouter.screen(const SplashScreen());
      case Routes.login:
        return AppRouter.screen(_login());
      case Routes.register:
        return AppRouter.screen(_register());
      case Routes.forgetPassword:
        return AppRouter.screen(_resetPassword());
      case Routes.home:
        return AppRouter.screen(const HomeScreen());

      default:
        return AppRouter.onUnknownScreen();
    }
  }

  static _login() {
    setupLoginBloc();
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const LoginScreen(),
    );
  }

  static _register() {
    setupRegisterBloc();
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
      child: const RegisterScreen(),
    );
  }

  static _resetPassword() {
    setupResetPasswordBloc();
    return BlocProvider(
      create: (context) => getIt<ResetPasswordBloc>(),
      child: const ForgetPasswordScreen(),
    );
  }
}

otpVertificationScreen(String phone) {
  setupVerfiyPhone();
  return BlocProvider(
    create: (context) => getIt<OTPBloc>(),
    child: OTPVertificationScreen(phoneNumber: phone),
  );
}
