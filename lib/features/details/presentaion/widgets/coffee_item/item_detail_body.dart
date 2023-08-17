import 'package:coffee_now/features/details/presentaion/widgets/coffee_item/custom_divider.dart';
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
    return const SingleChildScrollView(
      child: Column(
        children: [
          ImageHeaderSection(image: ImageAssetsPath.coffeeItemLarge),
          SizedBox(height: AppSize.s12),
          ItemNameAndPriceSection(),
          CustomDivider(),
          SizedBox(height: AppSize.s12),
          SugarLevelSection(),
          CustomDivider(),
          SizedBox(height: AppSize.s12),
          SpecialnstructionsSection(),
          SizedBox(height: AppSize.s28),
          ItemCountSection(),
          SizedBox(height: AppSize.s88),
        ],
      ),
    );
  }
}