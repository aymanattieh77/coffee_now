import 'package:flutter/material.dart';

import 'package:coffee_now/features/home/presentation/widgets/home/floating_basket_button.dart';
import 'package:coffee_now/features/home/presentation/widgets/home/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeBody(),
      ),
      floatingActionButton: FloatingBasketButton(),
    );
  }
}
