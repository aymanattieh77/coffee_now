import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class BackCircleButton extends StatelessWidget {
  const BackCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p5),
        decoration: BoxDecoration(
          color: AppColor.dark32.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          context.isArabicLocale()
              ? Assets.icons.arrowRight
              : Assets.icons.arrowLeft,
          height: AppSize.s20,
          width: AppSize.s20,
          colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
