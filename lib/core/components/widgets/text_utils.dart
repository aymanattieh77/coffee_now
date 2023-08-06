import 'package:coffee_now/core/resources/style.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:flutter/material.dart';

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
  });
  final String text;
  final FontWe fontWe;
  final Color? color;
  final double fontSize;
  final double? letterSpacing;
  final int maxLines;
  final bool softWrap;
  final FontFamily fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily.getFontFamily(),
        color: color ?? AppColor.dark2D,
        fontWeight: fontWe.getFontweight(),
        fontSize: FontSizes.f14,
        overflow: TextOverflow.ellipsis,
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
      ),
      maxLines: maxLines,
      softWrap: false,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
  }
}
