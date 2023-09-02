import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/features/details/presentaion/screens/coffee_shop_details_screen.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CoffeeShopCard extends StatelessWidget {
  const CoffeeShopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.push(context, const CoffeeShopDetailScreen());
        //TODO
      },
      child: Container(
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
              child: Image.asset(Assets.images.starbucksShop.path),
            ),
            const SizedBox(width: AppSize.s12),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      text: "Starbucks - CSB Mall", fontSize: FontSizes.f12),
                  SizedBox(height: AppSize.s6),
                  DistanceWithRateWidget(),
                  SizedBox(height: AppSize.s6),
                  DeliveryFeeAndOpenCloseTime()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryFeeAndOpenCloseTime extends StatelessWidget {
  const DeliveryFeeAndOpenCloseTime({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.icons.delivery),
        const SizedBox(width: AppSize.s3),
        TextUtils(
            text: "\$5.00",
            color: color ?? AppColor.greyAA,
            fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(Assets.icons.circle),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(Assets.icons.timeCircle),
        const SizedBox(width: AppSize.s3),
        TextUtils(
          text: "10.00 AM - 12.00 PM",
          color: color ?? AppColor.greyAA,
          fontSize: FontSizes.f10,
        ),
      ],
    );
  }
}

class DistanceWithRateWidget extends StatelessWidget {
  const DistanceWithRateWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.icons.location,
          height: AppSize.s12 + 2,
          width: AppSize.s12 + 2,
          colorFilter:
              ColorFilter.mode(color ?? AppColor.greyAA, BlendMode.srcIn),
        ),
        const SizedBox(width: AppSize.s3),
        TextUtils(
            text: "1.2 KM",
            color: color ?? AppColor.greyAA,
            fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(Assets.icons.circle),
        const SizedBox(width: AppSize.s3),
        SvgPicture.asset(Assets.icons.star),
        const SizedBox(width: AppSize.s3),
        TextUtils(
            text: "4.5",
            color: color?.withOpacity(0.7) ?? AppColor.grey7C,
            fontSize: FontSizes.f10),
        const SizedBox(width: AppSize.s3),
        TextUtils(
            text: "(425)",
            color: color ?? AppColor.greyAA,
            fontSize: FontSizes.f10),
      ],
    );
  }
}
