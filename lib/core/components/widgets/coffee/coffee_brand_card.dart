import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CoffeBrandCard extends StatelessWidget {
  const CoffeBrandCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Go to Coffee Shop
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: context.isDark() ? AppColor.darkContainer : AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              offset: const Offset(0, 2),
              color: AppColor.black.withOpacity(0.1),
            ),
          ],
        ),
        child: SizedBox(
          child: Image.asset(
            Assets.images.starbucksLogo.path,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
