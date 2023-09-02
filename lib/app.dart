import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:coffee_now/config/theme/themes.dart';

class CoffeeNow extends StatefulWidget {
  // Create Singlton Widget
  static const _instance = CoffeeNow._internal();

  factory CoffeeNow() => _instance;
  const CoffeeNow._internal();

  @override
  State<CoffeeNow> createState() => _CoffeeNowState();
}

class _CoffeeNowState extends State<CoffeeNow> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getIt<AppCahce>().getLocale().then((value) => context.setLocale(value));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coffee Now',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          onGenerateRoute: RouterGenerator.onGenerateRoute,
          initialRoute: kIsWeb ? Routes.admin : Routes.splash,
        );
      },
    );
  }
}
