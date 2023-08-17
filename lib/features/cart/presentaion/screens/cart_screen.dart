import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/components/widgets/custom_appbar.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/cart/presentaion/widgets/cart_items_listview.dart';
import 'package:coffee_now/features/checkout/presentaion/screens/order_details_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.myBasket),
      body: const CartItemsListview(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: CustomElevatedButton(
          text: AppStrings.goToCheckout,
          onPressed: () {
            //TODO
            AppRouter.push(context, const OrderDetailScreen());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
