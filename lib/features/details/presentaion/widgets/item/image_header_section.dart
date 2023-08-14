import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ImageHeaderSection extends StatelessWidget {
  const ImageHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.45,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Image.asset(
              ImageAssetsPath.coffeeItemLarge,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Row(
              children: [
                const BackCircleButton(),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AssetsIconPath.favourite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
