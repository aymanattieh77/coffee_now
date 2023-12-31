import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO go order detail
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.14,
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(Assets.images.coffeeItem.path),
                  ),
                  const SizedBox(width: AppSize.s12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text:
                                  "Starbucks - CSB Mall", // TODO get coffee shop name from firebase
                              color: context.isDark()
                                  ? AppColor.white
                                  : AppColor.dark2D,
                              fontSize: FontSizes.f12,
                              tr: false,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                // TODO edit item
                              },
                              child: const TextUtils(
                                text: AppStrings.edit,
                                color: AppColor.oranage,
                                fontSize: FontSizes.f12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s3),
                        const TextUtils(
                          text:
                              "1 items", //TODO number of items that user bought
                          color: AppColor.grey7D,
                          fontSize: FontSizes.f10,
                          tr: false,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: AppSize.s10),
            const Divider(thickness: 1.5, color: AppColor.greyAA),
          ],
        ),
      ),
    );
  }
}
