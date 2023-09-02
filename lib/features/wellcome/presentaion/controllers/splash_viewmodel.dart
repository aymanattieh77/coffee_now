import 'dart:async';

import 'package:coffee_now/features/admin/admin_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/core/functions/functions.dart';

class SplashViewModel extends SplashViewInputs implements SplashViewOutputs {
  late final AnimationController _animationController;
  late Animation<double> _animation;
  // ignore: unused_field
  late Timer _timer;

  @override
  Animation<double> get animation => _animation;

  @override
  void start(BuildContext context, TickerProviderStateMixin ticker) {
    initTimer(context);
    initAnimation(context, ticker);
    startAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }

  @override
  void goNextScreen(BuildContext context) {
    AppRouter.pushNamed(context, routeName: Routes.login, replacement: true);
  }

  @override
  void initAnimation(BuildContext context, TickerProviderStateMixin ticker) {
    _animationController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 700),
    );
    _animation =
        Tween<double>(begin: 0.2, end: 1.0).animate(_animationController);
  }

  @override
  void initTimer(BuildContext context) {
    _timer = Timer(
      const Duration(seconds: 3),
      () {
        dismissDialog(context);
        goNextScreen(context);
      },
    );
  }

  @override
  void startAnimation() {
    _animationController.forward();
  }
}

abstract class SplashViewInputs {
  void initTimer(BuildContext context);
  void initAnimation(BuildContext context, TickerProviderStateMixin ticker);
  void startAnimation();
  void goNextScreen(BuildContext context);
}

abstract class SplashViewOutputs {
  Animation<double> get animation;
  void start(BuildContext context, TickerProviderStateMixin ticker);
  void dispose();
}
