import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class AppLogoWithLabel extends StatelessWidget {
  const AppLogoWithLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          context.isDark()
              ? Assets.icons.applogoDark
              : Assets.icons.applogoLight,
        ),
        const SizedBox(height: AppSize.s16),
        TextUtils(
          text: label,
          color: context.isDark() ? AppColor.white : AppColor.strokeDark,
          fontSize: FontSizes.f24,
          fontWe: FontWe.semiBold,
        ),
      ],
    );
  }
}
