import 'package:coffee_now/core/components/widgets/icon_with_container.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeItemCard extends StatelessWidget {
  const CoffeItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO Go to Item Details screen
      },
      borderRadius: BorderRadius.circular(7),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.isDark() ? AppColor.darkContainer : AppColor.white,
          boxShadow: [
            BoxShadow(blurRadius: 30, color: AppColor.black.withOpacity(0.15)),
          ],
        ),
        width: MediaQuery.sizeOf(context).width * 0.40,
        height: MediaQuery.sizeOf(context).width * 0.60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ImageAssetsPath.coffeeItem,
                  ), //TODO get item image from firebase
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsIconPath.favourite),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: TextUtils(
                text: "MacchiatoShort", //TODO item name
                fontSize: FontSizes.f12,
                color: context.isDark() ? AppColor.white : AppColor.dark2D,
              ),
            ),
            const SizedBox(height: AppSize.s8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: Row(
                children: [
                  const TextUtils(
                    text: "\$5.00", //TODO item price
                    fontSize: FontSizes.f18,
                    color: AppColor.oranage,
                    fontFamily: FontFamily.bebasNeue,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      //TODO add to basket
                    },
                    child:
                        const IconWithContainer(svgPath: AssetsIconPath.basket),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
