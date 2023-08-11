import 'package:coffee_now/bloc_observer.dart';
import 'package:coffee_now/config/language/language_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:coffee_now/app.dart';
import 'package:coffee_now/config/language/language_manager.dart';
import 'package:coffee_now/config/services/service_locator.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await serviceLocatorStart();
  Bloc.observer = MyBLocObserver();
  runApp(
    Phoenix(
      child: EasyLocalization(
        path: assetsPathLocalization,
        supportedLocales: const [arabicLocale, englishLocale],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<LanguageCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<ThemeCubit>(),
            ),
          ],
          child: CoffeeNow(),
        ),
      ),
    ),
  );
}
