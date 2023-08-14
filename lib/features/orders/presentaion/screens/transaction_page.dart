import 'package:flutter/material.dart';

import 'package:coffee_now/features/orders/presentaion/widgets/orders_listview.dart';
import 'package:coffee_now/features/orders/presentaion/widgets/transaction_appbar.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TransactionAppbar(),
      body: OrdersListview(),
    );
  }
}
