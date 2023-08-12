import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p20,
        vertical: AppPadding.p5,
      ),
      child: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const BackCircleButton(),
        leadingWidth: AppSize.s40,
        title: TextUtils(text: title ?? "", fontSize: FontSizes.f16),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s40);
}
