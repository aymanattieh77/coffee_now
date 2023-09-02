import 'package:coffee_now/core/extensions/context_extensions.dart';

import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/values.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, this.onTap});
  final int currentIndex;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s10,
      margin: const EdgeInsets.all(AppPadding.p20),
      color: context.isDark() ? AppColor.darkContainer : AppColor.coffee,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: context.isDark() ? AppColor.strokeFieldDark : AppColor.coffee,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p5),
        child: BottomNavigationBar(
          elevation: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            _bottomNavigationBarItem(Assets.icons.home),
            _bottomNavigationBarItem(Assets.icons.search),
            _bottomNavigationBarItem(Assets.icons.document),
            _bottomNavigationBarItem(Assets.icons.profile),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem(String iconPath) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(AppColor.grey7D, BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(AppColor.white, BlendMode.srcIn),
      ),
      label: "",
    );
  }
}
