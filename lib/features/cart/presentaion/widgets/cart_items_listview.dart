import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/cart/presentaion/widgets/cart_item.dart';

class CartItemsListview extends StatelessWidget {
  const CartItemsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p20),
      itemBuilder: (context, index) {
        return const ItemCart(); //TODO get items from firebase
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s12,
        child: Divider(
          thickness: 2,
          color: AppColor.greyAA,
        ),
      ),
      itemCount: 4,
    );
  }
}
