import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';

import 'package:coffee_now/features/details/presentaion/widgets/coffee_shop/widgets.dart';
import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/image_header_section.dart';

class CoffeeShopDetailBody extends StatelessWidget {
  const CoffeeShopDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: [
        SliverToBoxAdapter(
          child: ImageHeaderSection(
            image: Assets.images.starbucksShop.path,
            child: const CoffeeShopInfo(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: AppSize.s10),
        ),
        const SliverToBoxAdapter(
          child: CoffeeCategoriesSection(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: AppSize.s10),
        ),
        const SliverFillRemaining(child: CoffeeShopItemsGridview())
      ],
    );
  }
}
