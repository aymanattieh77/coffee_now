import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/floating_basket_button.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/home_header_section.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/special_offer_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HomeHeaderSection(),
              SizedBox(height: AppSize.s12),
              SpecialOfferSection(),
              SizedBox(height: AppSize.s18),
              RecommendedForUserSection(),
              SizedBox(height: AppSize.s18),
              PopularBrandSection(),
              SizedBox(height: AppSize.s18),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingBasketButton(),
    );
  }
}

class RecommendedForUserSection extends StatelessWidget {
  const RecommendedForUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PopularBrandSection extends StatelessWidget {
  const PopularBrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CoffeeShopSection extends StatelessWidget {
  const CoffeeShopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
