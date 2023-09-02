import 'package:coffee_now/core/components/widgets/icon_with_container.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/values.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.label,
    required this.svgPath,
    this.onTap,
  });
  final String label;
  final String svgPath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDark();
    bool isArabicLocale = context.isArabicLocale();
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Row(
          children: [
            IconWithContainer(
              svgPath: svgPath,
              backgroundColor:
                  isDark ? AppColor.fillFieldDark : AppColor.whiteE9,
              iconColor: isDark ? AppColor.white : AppColor.dark2D,
            ),
            const SizedBox(width: AppSize.s12),
            TextUtils(
              text: label,
              color: isDark ? AppColor.white : AppColor.dark2D,
            ),
            const Spacer(),
            SvgPicture.asset(
              isArabicLocale ? Assets.icons.arrowLeft : Assets.icons.arrowRight,
              colorFilter: const ColorFilter.mode(
                AppColor.grey7D,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
