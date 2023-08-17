import 'package:flutter/material.dart';

import 'package:coffee_now/features/details/presentaion/widgets/coffee_shop/coffee_shop_detail_body.dart';

class CoffeeShopDetailScreen extends StatelessWidget {
  const CoffeeShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CoffeeShopDetailBody(),
      ),
    );
  }
}
