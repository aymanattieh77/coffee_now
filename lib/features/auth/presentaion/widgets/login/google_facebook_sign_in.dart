import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';

class GoogleFacebookSignIn extends StatelessWidget {
  const GoogleFacebookSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.isDark();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconButton(
          isDark: isDark,
          imagePath: Assets.images.google.path,
          onPress: () {
            BlocProvider.of<LoginBloc>(context).add(GoogleSign());
          },
        ),
        const SizedBox(width: AppSize.s54),
        _iconButton(
          isDark: isDark,
          imagePath: Assets.images.facebook.path,
          onPress: () {
            BlocProvider.of<LoginBloc>(context).add(FacebookSign());
          },
        ),
      ],
    );
  }

  InkWell _iconButton(
      {required String imagePath,
      required Function() onPress,
      required bool isDark}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        decoration: BoxDecoration(
          color: isDark ? AppColor.fillFieldDark : AppColor.white,
          border: Border.all(
              color: isDark ? AppColor.fillFieldDark : AppColor.whiteE9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: AppColor.black.withOpacity(0.10),
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Image.asset(imagePath),
      ),
    );
  }
}
