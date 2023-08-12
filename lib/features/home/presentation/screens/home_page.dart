import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/floating_basket_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/text_utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppLogoWithLabel(label: AppStrings.login),
            const SizedBox(height: AppSize.s36),
            // CustomTextField(),
            const SizedBox(height: AppSize.s28),
            TextUtils(text: getIt<AppCahce>().getUserUid())
            // CustomTextField(),
          ],
        ),
      ),
      floatingActionButton: const FloatingBasketButton(),
    );
  }
}
