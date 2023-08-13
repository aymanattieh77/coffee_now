import 'package:coffee_now/core/components/widgets/coffee/coffee_brand_card.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class PopularBrandSection extends StatelessWidget {
  const PopularBrandSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: TextUtils(
            text: "Popular Brand",
            color: context.isDark() ? AppColor.white : AppColor.dark2D,
            fontSize: FontSizes.f18,
            fontFamily: FontFamily.bebasNeue,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).width * 0.20,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            itemCount: 6,
            itemBuilder: (context, index) {
              return const CoffeBrandCard();
            },
            separatorBuilder: (context, index) =>
                const SizedBox(width: AppSize.s20),
          ),
        ),
      ],
    );
  }
}
