import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CustomAddressAppbar extends StatelessWidget {
  const CustomAddressAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const BackCircleButton(),
        const TextUtils(text: AppStrings.savedAddress),
        InkWell(
          onTap: () {
            //TODO clear all saved address
          },
          child: const Padding(
            padding: EdgeInsets.all(AppPadding.p5),
            child: TextUtils(text: AppStrings.clear),
          ),
        ),
      ],
    );
  }
}
