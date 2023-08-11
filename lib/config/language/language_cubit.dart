// ignore_for_file: use_build_context_synchronously

import 'package:coffee_now/config/language/language_manager.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/core/components/dialogs/dialogs.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class LanguageCubit extends Cubit<void> {
  LanguageCubit() : super(null);

  changeApplicationLanguage(BuildContext context) async {
    final String currentLanguage =
        await getIt<AppCahce>().getCurrentAppLanguage();

    showPopUpDialog(
      context,
      confirmText: AppStrings.english,
      cancelText: AppStrings.arabic,
      title: AppStrings.changeLanguage,
      onConfirm: () async {
        // change to english language
        _setLanguage(context, currentLanguage, LanugageType.english);
      },
      onCancel: () {
        // change to arabic language
        _setLanguage(context, currentLanguage, LanugageType.arabic);
      },
    );
  }

  _setLanguage(
    BuildContext context,
    String currentLanguage,
    LanugageType lanugageType,
  ) async {
    if (currentLanguage == lanugageType.getValue()) {
      dismissDialog(context);
    } else {
      await getIt<AppCahce>().changeAppLanguage(lanugageType);
      Phoenix.rebirth(context);
    }
  }
}
