import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/config/theme/themes.dart';
import 'package:flutter/material.dart';

class CoffeeNow extends StatelessWidget {
  const CoffeeNow({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Now',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // locale: ,
      // supportedLocales: ,
      // localizationsDelegates: ,
      onGenerateRoute: RouterGenerator.onGenerateRoute,
      // onUnknownRoute: (settings) {},
    );
  }
}
