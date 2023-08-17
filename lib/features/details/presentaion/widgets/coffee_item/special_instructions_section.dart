import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class SpecialnstructionsSection extends StatelessWidget {
  const SpecialnstructionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              TextUtils(text: AppStrings.specialInstructions),
              SizedBox(width: AppSize.s6),
              TextUtils(
                text: AppStrings.optional,
                color: AppColor.greyAA,
                fontSize: FontSizes.f10,
                fontWe: FontWe.regular,
              ),
            ],
          ),
          const SizedBox(height: AppSize.s12),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: context.isDark()
                          ? AppColor.strokeFieldDark
                          : AppColor.strokeField)),
              fillColor: context.isDark()
                  ? AppColor.fillFieldDark
                  : AppColor.strokeField,
              hintText: AppStrings.exInstructions.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
