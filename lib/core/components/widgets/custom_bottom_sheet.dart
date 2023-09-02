import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/strings.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: AppSize.s10,
            width: AppSize.s100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.isDark() ? AppColor.white : AppColor.coffee,
            ),
          ),
          const SizedBox(height: AppSize.s16),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(Assets.icons.gallery,
                    width: AppSize.s40, height: AppSize.s28),
                const SizedBox(width: AppSize.s20),
                const TextUtils(
                  text: AppStrings.gallery,
                  fontSize: FontSizes.f18,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s12),
          Row(
            children: [
              SvgPicture.asset(Assets.icons.camera,
                  width: AppSize.s40, height: AppSize.s28),
              const SizedBox(width: AppSize.s20),
              const TextUtils(
                text: AppStrings.camera,
                fontSize: FontSizes.f18,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
