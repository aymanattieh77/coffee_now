import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          color: AppColor.dark2D,
          thickness: 0.6,
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: TextUtils(
            text: AppStrings.or,
            color: AppColor.grey7C,
            fontSize: FontSizes.f18,
          ),
        ),
        Expanded(
            child: Divider(
          color: AppColor.dark2D,
          thickness: 0.6,
        )),
      ],
    );
  }
}
