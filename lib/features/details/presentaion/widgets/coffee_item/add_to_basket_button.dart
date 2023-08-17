import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: CustomElevatedButton(
        text: AppStrings.addToBasket,
        onPressed: () {}, //TODO Add Item To Cart
      ),
    );
  }
}
