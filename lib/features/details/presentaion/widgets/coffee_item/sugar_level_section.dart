import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';

class SugarLevelSection extends StatelessWidget {
  const SugarLevelSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextUtils(
            text: AppStrings.sugarLevel,
          ),
          const SizedBox(height: AppSize.s10),
          Row(
            children: [
              const TextUtils(
                text: AppStrings.normal,
                color: AppColor.greyAA,
                fontSize: FontSizes.f12,
                fontWe: FontWe.regular,
              ),
              const Spacer(),
              Radio(value: false, groupValue: false, onChanged: (value) {})
            ],
          ),
          Row(
            children: [
              const TextUtils(
                text: AppStrings.lessSugar,
                color: AppColor.greyAA,
                fontSize: FontSizes.f12,
                fontWe: FontWe.regular,
              ),
              const Spacer(),
              Radio(value: false, groupValue: false, onChanged: (value) {})
            ],
          ),
          const SizedBox(height: AppSize.s12),
        ],
      ),
    );
  }
}
