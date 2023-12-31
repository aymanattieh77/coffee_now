import 'package:coffee_now/features/address/presentaion/screens/saved_address_screen.dart';
import 'package:coffee_now/features/admin/admin_screen.dart';
import 'package:coffee_now/features/cart/presentaion/screens/cart_screen.dart';
import 'package:coffee_now/features/favourite/presentaion/screens/favourite_screen.dart';
import 'package:coffee_now/features/home/presentation/controllers/navigation/navigation_cubit.dart';
import 'package:coffee_now/features/notifications/presentation/screens/notification_screen.dart';
import 'package:coffee_now/features/profile/presentaion/screens/account_page.dart';
import 'package:coffee_now/features/settings/presentaion/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/service_locator/auth_service_locator.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/otp_vertification/otp_cubit.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/register/register_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/reset_password/reset_password_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/screens/forget_password_screen.dart';
import 'package:coffee_now/features/auth/presentaion/screens/login_screen.dart';
import 'package:coffee_now/features/auth/presentaion/screens/otp_verification_screen.dart';
import 'package:coffee_now/features/auth/presentaion/screens/register_screen.dart';
import 'package:coffee_now/features/home/presentation/screens/home_screen.dart';
import 'package:coffee_now/features/wellcome/presentaion/screens/splash_screen.dart';

abstract class Routes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgetPassword = '/forgetPassword';
  static const home = '/home';
  static const setting = '/setting';
  static const favourites = '/favourites';
  static const cart = '/cart';
  static const account = '/account';
  static const savedAddress = '/savedAddress';
  static const admin = '/admin';
  static const notification = '/notification';
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
        return AppRouter.screen(_homeScreen());
      case Routes.setting:
        return AppRouter.screen(const SettingScreen());
      case Routes.favourites:
        return AppRouter.screen(_favourite());
      case Routes.cart:
        return AppRouter.screen(_cart());
      case Routes.account:
        return AppRouter.screen(_account());
      case Routes.savedAddress:
        return AppRouter.screen(_savedAddress());
      case Routes.admin:
        return AppRouter.screen(const AdminScreen());
      case Routes.notification:
        return AppRouter.screen(const NotificationScreen());

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

  static _homeScreen() {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const HomeScreen(),
    );
  }

  static _favourite() {
    return const FavouriteScreen();
  }

  static _cart() {
    return const CartScreen();
  }

  static _account() {
    return const AccountPage();
  }

  static _savedAddress() {
    return const SavedAddressScreen();
  }
}

otpVertificationScreen(String phone) {
  setupVerfiyPhone();
  return BlocProvider(
    create: (context) => getIt<OTPCubit>(),
    child: OTPVertificationScreen(phoneNumber: phone),
  );
}
