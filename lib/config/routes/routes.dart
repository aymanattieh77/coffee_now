import 'package:flutter/material.dart';

import 'package:coffee_now/config/routes/app_router.dart';

abstract class Routes {
  static const splash = '/';
}

abstract class RouterGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return AppRouter.screen(const Scaffold());

      default:
        return AppRouter.onUnknownScreen();
    }
  }
}
