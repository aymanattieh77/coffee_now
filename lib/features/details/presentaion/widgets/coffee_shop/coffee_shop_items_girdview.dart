import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/coffee/coffee_item_card.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CoffeeShopItemsGridview extends StatelessWidget {
  const CoffeeShopItemsGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppPadding.p20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: AppSize.s20,
        mainAxisSpacing: AppSize.s20,
      ),
      itemBuilder: (context, index) {
        // TODO Get Favourties items
        // TODO categorize coffee category
        return const CoffeItemCard();
      },
    );
  }
}
