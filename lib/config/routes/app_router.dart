import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/text_utils.dart';

class AppRouter {
  static MaterialPageRoute screen(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  static onUnknownScreen() {
    return MaterialPageRoute(
      builder: (ctx) => const Scaffold(
        body: Center(
          child: TextUtils(text: "onUnknownRoute", fontSize: 30),
        ),
      ),
    );
  }

  static push(BuildContext context, Widget page, [bool replacement = false]) {
    if (replacement) {
      Navigator.of(context).pushReplacement(screen(page));
    } else {
      Navigator.of(context).push(screen(page));
    }
  }

  static pushNamed(BuildContext context,
      {required String routeName, bool replacement = false, Object? args}) {
    if (replacement) {
      Navigator.of(context).pushReplacementNamed(routeName, arguments: args);
    } else {
      Navigator.of(context).pushNamed(routeName, arguments: args);
    }
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil((route) => route.settings.name == routeName);
  }
}
