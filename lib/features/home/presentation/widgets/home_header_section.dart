import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/icon_with_container.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Row(
        children: [
          _usernameWithLocation(context),
          const Spacer(),
          _actionButtons(context)
        ],
      ),
    );
  }

  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            //TODO go to ticket
          },
          child: IconWithContainer(
            svgPath: Assets.icons.ticket,
            backgroundColor: AppColor.coffee,
          ),
        ),
        const SizedBox(width: AppSize.s16),
        InkWell(
          onTap: () {
            AppRouter.pushNamed(context, routeName: Routes.favourites);
          },
          child: IconWithContainer(
            svgPath: Assets.icons.heart,
            backgroundColor: AppColor.coffee,
          ),
        ),
      ],
    );
  }

  Widget _usernameWithLocation(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextUtils(
              text: AppStrings.hello,
              color: context.isDark() ? AppColor.white : AppColor.coffee,
              fontSize: FontSizes.f18,
              fontWe: FontWe.semiBold,
            ),
            const TextUtils(
              text: ", Ayman Attieh", //TODO get name from database
              color: AppColor.oranage,
              fontSize: FontSizes.f18,
              fontWe: FontWe.semiBold,
              tr: false,
            ),
          ],
        ),
        const SizedBox(height: AppSize.s3),
        Row(
          children: [
            SvgPicture.asset(
              Assets.icons.location,
              height: AppSize.s16,
              width: AppSize.s16,
              colorFilter:
                  const ColorFilter.mode(AppColor.oranage, BlendMode.srcIn),
            ),
            const SizedBox(width: AppSize.s3),
            TextUtils(
              text: "Amman, Jordan"
                  .toUpperCase(), //TODO get location from database
              color: AppColor.oranage,
              fontSize: FontSizes.f18,
              fontWe: FontWe.semiBold,
              fontFamily: FontFamily.bebasNeue,
              tr: false,
            ),
          ],
        )
      ],
    );
  }
}
