import 'package:coffee_now/core/components/widgets/custom_elevated_button.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/assets.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

showPopUpDialog(BuildContext context,
    {required String confirmText,
    required String cancelText,
    required String title,
    required Function() onConfirm,
    required Function() onCancel}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        icon: SvgPicture.asset(
          context.isDark()
              ? AssetsIconPath.appLogoDark
              : AssetsIconPath.appLogoLight,
        ),
        actions: [
          CustomElevatedButton(
            text: cancelText,
            onPressed: onCancel,
            size: const Size(AppSize.s100, AppSize.s36),
          ),
          CustomElevatedButton(
            text: confirmText,
            onPressed: onConfirm,
            size: const Size(AppSize.s100, AppSize.s36),
          ),
        ],
        title: TextUtils(
          text: title,
          fontSize: 20,
          fontWe: FontWe.semiBold,
          color: context.isDark() ? AppColor.white : AppColor.coffee,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      );
    },
  );
}

showFullScreenDialog(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: child,
      );
    },
  );
}
