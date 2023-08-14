import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/custom_list_tile.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppSize.s75),
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              //TODO profile picture
              backgroundColor: Colors.green,
              radius: 50,
            ),
          ),
          const SizedBox(height: AppSize.s75),
          CustomListTile(
            label: AppStrings.editAccountInfo,
            svgPath: AssetsIconPath.edit,
            onTap: () {
              AppRouter.pushNamed(context, routeName: Routes.account);
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomListTile(
            label: AppStrings.favorites,
            svgPath: AssetsIconPath.heart,
            onTap: () {
              AppRouter.pushNamed(context, routeName: Routes.favourites);
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomListTile(
            label: AppStrings.savedAddress,
            svgPath: AssetsIconPath.location,
            onTap: () {
              AppRouter.pushNamed(context, routeName: Routes.savedAddress);
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomListTile(
            label: AppStrings.rewardsORCoupon,
            svgPath: AssetsIconPath.discount,
            onTap: () {
              //TODO go TO rewardsORCoupon screen
            },
          ),
          const SizedBox(height: AppSize.s20),
          CustomListTile(
            label: AppStrings.settings,
            svgPath: AssetsIconPath.settings,
            onTap: () {
              AppRouter.pushNamed(context, routeName: Routes.setting);
            },
          ),
        ],
      ),
    );
  }
}
