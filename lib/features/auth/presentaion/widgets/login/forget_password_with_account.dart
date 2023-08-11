import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

Widget dontHaveAccount(BuildContext context) {
  return InkWell(
    onTap: () {
      AppRouter.pushNamed(
        context,
        routeName: Routes.register,
        replacement: true,
      );
    },
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtils(
          text: AppStrings.dontHaveAccount,
          color: AppColor.grey7D,
        ),
        SizedBox(width: AppSize.s5),
        TextUtils(
          text: AppStrings.register,
          color: AppColor.oranage,
        )
      ],
    ),
  );
}

Widget forgetPassword() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {
          // AppRouter.pushNamed(
          //   context,
          //   routeName: Routes.forgetPassword,
          // );
        },
        child: const TextUtils(
          text: AppStrings.forgetPassword,
          color: AppColor.oranage,
          fontSize: FontSizes.f12,
        ),
      ),
    ],
  );
}
