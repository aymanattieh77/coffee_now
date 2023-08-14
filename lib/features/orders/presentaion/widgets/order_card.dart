import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO go order detail
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.15,
        padding: const EdgeInsets.all(AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.isDark() ? AppColor.darkContainer : AppColor.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 28,
              color: const Color(0xff4F4F4F).withOpacity(0.15),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(ImageAssetsPath.starbuckShop),
            const SizedBox(width: AppSize.s12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextUtils(
                        text:
                            "Starbucks - CSB Mall", // TODO get coffee shop name from firebase
                        color: AppColor.dark2D,
                        fontSize: FontSizes.f12,
                        tr: false,
                      ),
                      Spacer(),
                      TextUtils(
                        text: "28, July 2021", // TODO get date that user buy
                        color: AppColor.grey7D,
                        fontSize: FontSizes.f8,
                        tr: false,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s3),
                  TextUtils(
                    text: "2 items", //TODO number of items that user bought
                    color: AppColor.grey7D,
                    fontSize: FontSizes.f10,
                    tr: false,
                  ),
                  SizedBox(height: AppSize.s3),
                  TextUtils(
                    text: AppStrings.reorder,
                    color: AppColor.oranage,
                    fontSize: FontSizes.f12,
                    fontWe: FontWe.medium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
