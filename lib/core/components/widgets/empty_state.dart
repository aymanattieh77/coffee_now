import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.iconPath, required this.message});
  final String iconPath;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .40,
            height: MediaQuery.sizeOf(context).height * .40,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                AppColor.coffee,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: AppSize.s36),
          TextUtils(
            text: message,
            fontSize: FontSizes.f36,
            maxLines: 2,
            fontWe: FontWe.semiBold,
            color: context.isDark() ? AppColor.white : AppColor.coffee,
          ),
        ],
      ),
    );
  }
}
