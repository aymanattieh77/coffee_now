import 'package:coffee_now/features/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HomeHeaderSection(),
          SizedBox(height: AppSize.s12),
          SpecialOfferSection(),
          SizedBox(height: AppSize.s18),
          RecommendedForUserSection(),
          SizedBox(height: AppSize.s18),
          PopularBrandSection(),
          SizedBox(height: AppSize.s18),
          CoffeeShopSection(),
        ],
      ),
    );
  }
}
