import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/app.dart';
import 'package:coffee_now/config/language/language_manager.dart';
import 'package:coffee_now/config/services/service_locator.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await serviceLocatorStart();
  runApp(
    EasyLocalization(
      path: assetsPathLocalization,
      supportedLocales: const [arabicLocale, englishLocale],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<ThemeCubit>(),
          ),
        ],
        child: CoffeeNow(),
      ),
    ),
  );
}
