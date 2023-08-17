import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';

import 'package:coffee_now/features/details/presentaion/widgets/coffee_shop/widgets.dart';
import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/image_header_section.dart';

class CoffeeShopDetailBody extends StatelessWidget {
  const CoffeeShopDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      primary: true,
      slivers: [
        SliverToBoxAdapter(
          child: ImageHeaderSection(
            image: ImageAssetsPath.starbuckShop,
            child: CoffeeShopInfo(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: AppSize.s10),
        ),
        SliverToBoxAdapter(
          child: CoffeeCategoriesSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: AppSize.s10),
        ),
        SliverFillRemaining(child: CoffeeShopItemsGridview())
      ],
    );
  }
}
