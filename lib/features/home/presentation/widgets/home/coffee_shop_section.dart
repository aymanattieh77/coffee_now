import 'package:coffee_now/core/components/widgets/coffee/coffee_shop_card.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CoffeeShopSection extends StatelessWidget {
  const CoffeeShopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: TextUtils(
            text: AppStrings.coffeeShop,
            color: context.isDark() ? AppColor.white : AppColor.dark2D,
            fontSize: FontSizes.f18,
            fontFamily: FontFamily.bebasNeue,
          ),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const CoffeeShopCard();
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSize.s16),
        ),
      ],
    );
  }
}
