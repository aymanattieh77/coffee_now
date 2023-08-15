import 'package:coffee_now/features/favourite/presentaion/widgets/favourite_gridview_section.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/coffee/coffee_shop_card.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/details/presentaion/widgets/coffee_shop/coffee_categories_section.dart';
import 'package:coffee_now/features/details/presentaion/widgets/item/image_header_section.dart';

class CoffeeShopDetailScreen extends StatelessWidget {
  const CoffeeShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ImageHeaderSection(
              image: ImageAssetsPath.starbuckShop,
              child: CoffeeShopInfo(),
            ),
            SizedBox(height: AppSize.s10),
            CoffeeCategoriesSection(),
            SizedBox(height: AppSize.s16),
            Expanded(child: CoffeeItemsGridview()),
          ],
        ),
      ),
    );
  }
}

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
