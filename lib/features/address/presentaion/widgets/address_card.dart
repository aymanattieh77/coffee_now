import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO go To Edit Address
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.whiteE9,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.icons.locationFilled),
            const SizedBox(width: AppSize.s16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: "Rifqi Arkaanul", //TODO get Street Nam
                  color: context.isDark() ? AppColor.oranage : AppColor.coffee,
                  fontSize: FontSizes.f14,
                  fontWe: FontWe.medium,
                ),
                const SizedBox(width: AppSize.s3),
                const TextUtils(
                  text:
                      "Cirebon, West Java, Indonesia", //TODO get City, Country
                  color: AppColor.greyAA,
                  fontSize: FontSizes.f12,
                ),
              ],
            ),
            const Spacer(),
            SvgPicture.asset(Assets.icons.arrowRight)
          ],
        ),
      ),
    );
  }
}
