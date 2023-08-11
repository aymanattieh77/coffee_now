import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.textColor,
      this.elevation,
      this.size,
      this.uppercase = true});
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final Size? size;
  final bool uppercase;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).primaryColor,
          minimumSize: size ?? const Size(double.infinity, AppSize.s54),
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(AppPadding.p5)),
      onPressed: onPressed,
      child: TextUtils(
        text: uppercase ? text : text,
        fontSize: 18,
        fontWe: FontWe.semiBold,
        color: textColor ??
            (context.isDark() ? AppColor.strokeDark : AppColor.white),
      ),
    );
  }
}
