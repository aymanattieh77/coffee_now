import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ImageHeaderSection extends StatelessWidget {
  const ImageHeaderSection({
    super.key,
    this.child,
    required this.image,
  });
  final Widget? child;
  final String image;
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
              image,
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
                  icon: SvgPicture.asset(Assets.icons.favouriteCircle),
                ),
              ],
            ),
          ),
          if (child != null)
            Positioned(
              left: AppSize.s20,
              bottom: AppSize.s30,
              child: child!,
            )
        ],
      ),
    );
  }
}
