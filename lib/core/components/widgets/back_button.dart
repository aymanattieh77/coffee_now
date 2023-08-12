import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class BackCircleButton extends StatelessWidget {
  const BackCircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabicLocale = context.isArabicLocale();
    return Row(
      mainAxisAlignment:
          isArabicLocale ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            AppRouter.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: AppColor.dark3E_30,
            child: SvgPicture.asset(
              isArabicLocale
                  ? AssetsIconPath.arrowRight
                  : AssetsIconPath.arrowLeft,
              colorFilter:
                  const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }
}