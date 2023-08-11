import 'package:easy_localization/easy_localization.dart' as translate;
import 'package:flutter/material.dart';

import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/style.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({
    super.key,
    required this.text,
    this.fontWe = FontWe.medium,
    this.fontSize = FontSizes.f14,
    this.letterSpacing,
    this.color,
    this.softWrap = false,
    this.maxLines = 1,
    this.fontFamily = FontFamily.poppins,
    this.tr = true,
  });
  final String text;
  final FontWe fontWe;
  final Color? color;
  final double fontSize;
  final double? letterSpacing;
  final int maxLines;
  final bool softWrap;
  final FontFamily fontFamily;
  final bool tr;
  @override
  Widget build(BuildContext context) {
    return Text(
      tr ? text.tr() : text,
      style: TextStyle(
        fontFamily: fontFamily.getFontFamily(),
        color: color ?? (context.isDark() ? AppColor.white : AppColor.black),
        fontWeight: fontWe.getFontweight(),
        fontSize: fontSize,
        overflow: TextOverflow.ellipsis,
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      softWrap: false,
      textDirection:
          context.isArabicLocale() ? TextDirection.rtl : TextDirection.ltr,
      textAlign: TextAlign.center,
    );
  }
}
