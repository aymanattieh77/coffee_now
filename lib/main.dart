import 'package:coffee_now/features/notifications/data/messaging/api_messaging.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:coffee_now/app.dart';
import 'package:coffee_now/bloc_observer.dart';
import 'package:coffee_now/config/language/language_cubit.dart';
import 'package:coffee_now/config/language/language_manager.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/config/theme/theme_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseCrashlytics.instance.crash();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await EasyLocalization.ensureInitialized();
  await serviceLocatorStart();
  setupNotification();
  FirebaseMessaging.onBackgroundMessage(handler);
  await getIt.get<APIMessagingService>().initNotifications();

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
