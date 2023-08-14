import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomBottomSheet(context, const CustomBottomSheet());
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          const CircleAvatar(
            //TODO profile picture
            backgroundColor: Colors.green,
            radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: SvgPicture.asset(
              AssetsIconPath.addCircle,
              height: AppSize.s20,
              width: AppSize.s20,
            ),
          ),
        ],
      ),
    );
  }
}
