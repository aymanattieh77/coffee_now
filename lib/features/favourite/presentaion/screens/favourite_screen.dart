import 'package:coffee_now/features/favourite/presentaion/widgets/favourite_gridview_section.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/custom_appbar.dart';
import 'package:coffee_now/core/resources/resources.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: AppStrings.favouriteItems),
      body: FavouritesGridviewSection(),
    );
  }
}
