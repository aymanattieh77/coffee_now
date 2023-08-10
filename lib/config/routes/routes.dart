import 'package:coffee_now/features/auth/presentaion/screens/login_screen.dart';
import 'package:coffee_now/features/wellcome/presentaion/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/config/routes/app_router.dart';

abstract class Routes {
  static const splash = '/';
  static const login = '/login';
}

abstract class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return AppRouter.screen(const SplashScreen());
      case Routes.login:
        return AppRouter.screen(const LoginScreen());

      default:
        return AppRouter.onUnknownScreen();
    }
  }
}
