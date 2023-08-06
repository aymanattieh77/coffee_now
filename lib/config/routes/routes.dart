import 'package:coffee_now/config/routes/app_router.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const splash = '/';
}

abstract class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return AppRouter.screen(const Scaffold());

      default:
        return AppRouter.screen(const Scaffold());
    }
  }
}
