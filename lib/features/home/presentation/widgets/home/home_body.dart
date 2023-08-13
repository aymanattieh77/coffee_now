import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/coffee_shop_section.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/home_header_section.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/popular_brand_section.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/recommended_for_user_section.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/special_offer_section.dart';

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
