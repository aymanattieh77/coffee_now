import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/resources/resources.dart';

class IconWithContainer extends StatelessWidget {
  const IconWithContainer({
    super.key,
    required this.svgPath,
    this.iconColor = AppColor.white,
    this.backgroundColor = AppColor.dark3E_60,
  });
  final String svgPath;
  final Color iconColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p5),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(6)),
      child: SvgPicture.asset(
        svgPath,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        height: AppSize.s20,
        width: AppSize.s20,
      ),
    );
  }
}
