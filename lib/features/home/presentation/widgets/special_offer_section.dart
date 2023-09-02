import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';

class SpecialOfferSection extends StatelessWidget {
  const SpecialOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: BannerOfferWidget(),
    );
  }
}

class BannerOfferWidget extends StatelessWidget {
  const BannerOfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: MediaQuery.sizeOf(context).width,
              child: Image.asset(Assets.images.container.path,
                  fit: BoxFit.contain),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20 * 2,
              vertical: AppPadding.p20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                      text: "GET",
                      style: TextStyle(
                          fontFamily: FontFamily.bebasNeue.getFontFamily(),
                          color: AppColor.white,
                          fontSize: FontSizes.f24),
                      children: [
                        TextSpan(
                          text: "50%",
                          style: TextStyle(
                              fontFamily: FontFamily.bebasNeue.getFontFamily(),
                              color: AppColor.oranage,
                              fontSize: FontSizes.f36),
                        ),
                        TextSpan(
                          text: " AS A Joining Bonus",
                          style: TextStyle(
                            fontFamily: FontFamily.bebasNeue.getFontFamily(),
                            color: AppColor.white,
                            fontSize: FontSizes.f24,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: AppSize.s18),
                const TextUtils(
                  text: "use code on checkout",
                  fontFamily: FontFamily.bebasNeue,
                  color: AppColor.white,
                  fontSize: FontSizes.f12,
                ),
                const SizedBox(height: AppSize.s3),
                const TextUtils(
                  text: "5656ASD95",
                  fontFamily: FontFamily.bebasNeue,
                  color: AppColor.oranage,
                  fontSize: FontSizes.f36,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
