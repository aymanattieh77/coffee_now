import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/orders/presentaion/widgets/order_card.dart';

class OrdersListview extends StatelessWidget {
  const OrdersListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: OrderCard(),
        ); //TODO
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppSize.s12);
      },
    );
  }
}
