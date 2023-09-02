import 'package:coffee_now/config/language/language_cubit.dart';
import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/components/widgets/custom_appbar.dart';
import 'package:coffee_now/core/components/widgets/custom_list_tile.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/settings/presentaion/screens/dark_mode_screen.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.settings),
      body: Column(
        children: [
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.changeLanguage,
            svgPath: Assets.icons.home,
            onTap: () {
              BlocProvider.of<LanguageCubit>(context)
                  .changeApplicationLanguage(context);
            },
          ),
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.darkMode,
            svgPath: Assets.icons.edit,
            onTap: () {
              AppRouter.push(context, const DarkModeScreen());
            },
          ),
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.privacyPolicy,
            svgPath: Assets.icons.document,
            onTap: () {
              //TODO go To
            },
          ),
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.aboutCoffeeNowApps,
            svgPath: Assets.icons.location,
            onTap: () {},
          ),
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.rateOurApp,
            svgPath: Assets.icons.edit,
            onTap: () {},
          ),
          const SizedBox(height: AppSize.s25),
          CustomListTile(
            label: AppStrings.faq,
            svgPath: Assets.icons.moreSquare,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
