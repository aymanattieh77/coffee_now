import 'package:flutter/material.dart';

import 'package:coffee_now/features/details/presentaion/widgets/item/widgets.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ItemDetailBody(),
      floatingActionButton: AddToBasketButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
