import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/custom_divider.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/image_header_section.dart';
import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/widgets.dart';

class CoffeeItemDetailBody extends StatelessWidget {
  const CoffeeItemDetailBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageHeaderSection(image: Assets.images.coffeeItemLarge.path),
          const SizedBox(height: AppSize.s12),
          const ItemNameAndPriceSection(),
          const CustomDivider(),
          const SizedBox(height: AppSize.s12),
          const SugarLevelSection(),
          const CustomDivider(),
          const SizedBox(height: AppSize.s12),
          const SpecialnstructionsSection(),
          const SizedBox(height: AppSize.s28),
          const ItemCountSection(),
          const SizedBox(height: AppSize.s88),
        ],
      ),
    );
  }
}
