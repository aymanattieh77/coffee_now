import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:coffee_now/core/components/widgets/custom_appbar.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeScreen extends StatelessWidget {
  const DarkModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.darkMode),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSize.s8),
            const SizedBox(height: AppSize.s10),
            Row(
              children: [
                const TextUtils(text: AppStrings.darkMode),
                const Spacer(),
                Switch.adaptive(
                  inactiveThumbColor: AppColor.whiteF5,
                  inactiveTrackColor: AppColor.whiteE9,
                  activeColor: AppColor.cyan,
                  activeTrackColor: AppColor.cyan.withOpacity(0.6),
                  value: context.isDark(),
                  onChanged: (value) {
                    BlocProvider.of<ThemeCubit>(context).changeAppThemeMode();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
