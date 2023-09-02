import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:coffee_now/core/resources/values.dart';
import 'package:coffee_now/features/wellcome/presentaion/controllers/splash_viewmodel.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final splashViewModel = SplashViewModel();

  @override
  void initState() {
    super.initState();
    splashViewModel.start(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _backgroundImage(context),
            _applogoWithText(context),
          ],
        ),
      ),
    );
  }

  Widget _applogoWithText(BuildContext context) {
    return Positioned(
      top: MediaQuery.sizeOf(context).height * 0.6,
      child: AnimatedBuilder(
          animation: splashViewModel.animation,
          builder: (context, _) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              opacity: splashViewModel.animation.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.icons.applogoLight),
                  const SizedBox(height: AppSize.s12),
                  SvgPicture.asset(Assets.icons.coffeeNow),
                ],
              ),
            );
          }),
    );
  }

  Widget _backgroundImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.70,
      width: MediaQuery.sizeOf(context).width,
      child: Image.asset(
        Assets.images.maskGroup.path,
        fit: BoxFit.fill,
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  void dispose() {
    splashViewModel.dispose();

    super.dispose();
  }
}
