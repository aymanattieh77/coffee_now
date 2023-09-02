import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCountSection extends StatelessWidget {
  const ItemCountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {}, //TODO increase item count
          child: SvgPicture.asset(Assets.icons.mines),
        ),
        const SizedBox(width: AppSize.s18),
        const TextUtils(text: "1", fontSize: FontSizes.f24),
        const SizedBox(width: AppSize.s18),
        InkWell(
          onTap: () {}, //TODO deccrease item count
          child: SvgPicture.asset(Assets.icons.add),
        )
      ],
    );
  }
}
