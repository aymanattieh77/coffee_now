import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ItemNameAndPriceSection extends StatelessWidget {
  const ItemNameAndPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextUtils(
                text: "Macchiato Short", // TODO get Item Name From firebase
                fontSize: FontSizes.f18,
              ),
              Spacer(),
              TextUtils(
                text: "\$5.00", // TODO get Item Price From firebase
                fontSize: FontSizes.f18,

                color: AppColor.oranage,
              ),
            ],
          ),
          SizedBox(height: AppSize.s5),
          TextUtils(
            text: "Macchiato Short",
            fontSize: FontSizes.f12,
            color: AppColor.grey7C,
          ),
          SizedBox(height: AppSize.s12),
        ],
      ),
    );
  }
}
