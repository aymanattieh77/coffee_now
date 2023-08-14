import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class TransactionAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TransactionAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextUtils(
        text: AppStrings.transactions,
        fontSize: FontSizes.f16,
        fontWe: FontWe.medium,
        color: context.isDark() ? AppColor.white : AppColor.coffee,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s40);
}
