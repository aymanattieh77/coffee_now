import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.isDark() ? AppColor.strokeFieldDark : AppColor.whiteE9,
      thickness: 8,
    );
  }
}
