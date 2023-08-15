import 'package:flutter/material.dart';

import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/values.dart';

class CoffeeCategoriesSection extends StatelessWidget {
  const CoffeeCategoriesSection({super.key, this.onTap});
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: TabBar(
        unselectedLabelColor: AppColor.greyAA,
        labelColor: AppColor.oranage,
        indicatorColor: AppColor.oranage,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        indicatorPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p5,
          vertical: AppPadding.p5,
        ),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColor.oranage),
          color: context.isDark() ? AppColor.darkContainer : AppColor.white,
        ),
        isScrollable: true,
        onTap: onTap,
        tabs: const [
          Tab(text: "Iced Coffee"), //TODO get Categories from Firebase
          Tab(text: "Hot Coffee"),
          Tab(text: "Hot Drinks"),
          Tab(text: "Donats"),
          Tab(text: "Cookies"),
        ],
      ),
    );
  }
}
