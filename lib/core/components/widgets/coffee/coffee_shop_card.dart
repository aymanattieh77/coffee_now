import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CoffeeShopCard extends StatelessWidget {
  const CoffeeShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
        color: context.isDark() ? AppColor.darkContainer : AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(ImageAssetsPath.starbuckShop),
          ),
          const SizedBox(width: AppSize.s12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextUtils(
                    text: "Starbucks - CSB Mall", fontSize: FontSizes.f12),
                const SizedBox(height: AppSize.s6),
                _distanceWithRateWidget(),
                const SizedBox(height: AppSize.s6),
                _deliveryFeeAndOpenCloseTime()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _distanceWithRateWidget() {
    return Row(
      children: [
        SvgPicture.asset(
          AssetsIconPath.location,
          height: AppSize.s12 + 2,
          width: AppSize.s12 + 2,
          colorFilter: const ColorFilter.mode(AppColor.greyAA, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSize.s3),
        const TextUtils(
            text: "1.2 KM", color: AppColor.greyAA, fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(AssetsIconPath.circle),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(AssetsIconPath.star),
        const SizedBox(width: AppSize.s3),
        const TextUtils(
            text: "4.5", color: AppColor.grey7C, fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        const TextUtils(
            text: "(425)", color: AppColor.greyAA, fontSize: FontSizes.f10),
      ],
    );
  }

  Widget _deliveryFeeAndOpenCloseTime() {
    return Row(
      children: [
        SvgPicture.asset(AssetsIconPath.delivery),
        const SizedBox(width: AppSize.s3),
        const TextUtils(
            text: "\$5.00", color: AppColor.greyAA, fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(AssetsIconPath.circle),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(AssetsIconPath.timeCircle),
        const SizedBox(width: AppSize.s3),
        const TextUtils(
          text: "10.00 AM - 12.00 PM",
          color: AppColor.greyAA,
          fontSize: FontSizes.f10,
        ),
      ],
    );
  }
}
