import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/coffee/coffee_shop_card.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CoffeeShopInfo extends StatelessWidget {
  const CoffeeShopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: "Starbucks - CSB Mall",
          color: AppColor.white,
          fontSize: FontSizes.f24,
          fontWe: FontWe.semiBold,
        ),
        SizedBox(height: AppSize.s5),
        DistanceWithRateWidget(color: AppColor.white),
        SizedBox(height: AppSize.s5),
        DeliveryFeeAndOpenCloseTime(
          color: AppColor.white,
        )
      ],
    );
  }
}
