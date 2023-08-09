import 'package:coffee_now/config/theme/theme_cubit.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/assets.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingBasketButton extends StatelessWidget {
  const FloatingBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDark();
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        InkWell(
          onTap: () {
            // TODO Open Basket Screen
            BlocProvider.of<ThemeCubit>(context).switchAppThemeMode();
          },
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: isDark ? AppColor.darkContainer : AppColor.white,
                  border: Border.all(
                    color: isDark ? AppColor.strokeFieldDark : AppColor.whiteE9,
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      color: isDark
                          ? const Color(0xff280909).withOpacity(0.25)
                          : const Color(0xff747474).withOpacity(0.25),
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  AssetsIconPath.basket,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColor.white : AppColor.coffee,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(AppPadding.p10 - 5),
                child: Badge(
                  backgroundColor: AppColor.oranage,
                  label: Text("1", style: TextStyle(color: AppColor.white)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.s88),
      ],
    );
  }
}
