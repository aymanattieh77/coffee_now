import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.controller});
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      decoration: BoxDecoration(
        color: context.isDark() ? AppColor.fillFieldDark : AppColor.fillField,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.isDark() ? AppColor.fillFieldDark : AppColor.fillField,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.s25,
              height: AppSize.s25,
              child: SvgPicture.asset(
                AssetsIconPath.search,
                colorFilter:
                    const ColorFilter.mode(AppColor.greyAA, BlendMode.srcIn),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: context.isDark()
                      ? AppColor.fillFieldDark
                      : AppColor.fillField,
                  hintStyle: TextStyle(
                    color: context.isDark()
                        ? AppColor.hintFieldDark
                        : AppColor.hintField,
                    fontSize: FontSizes.f14,
                  ),
                  hintText: AppStrings.search.tr(),
                  enabledBorder: _border(),
                  focusedBorder: _border(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputBorder _border() {
    return InputBorder.none;
  }
}
