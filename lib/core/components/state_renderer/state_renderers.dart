import 'package:coffee_now/core/components/widgets/custom_elevated_button.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingStateRender extends StatelessWidget {
  const LoadingStateRender({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Lottie.asset(Assets.animations.animationLoading),
      ),
    );
  }
}

class ErrorStateRender extends StatelessWidget {
  const ErrorStateRender({
    super.key,
    required this.errorMessage,
    required this.tryAgain,
    required this.restartApp,
  });
  final String errorMessage;
  final Function() tryAgain;
  final Function() restartApp;
  @override
  Widget build(BuildContext context) {
    return FullScreenDialogWidget(
      animationPath: Assets.animations.animationError2,
      title: AppStrings.errorHappened,
      message: errorMessage,
      primaryButtonText: AppStrings.tryAgain,
      secondaryButtonText: AppStrings.restartApp,
      primaryOnPress: tryAgain,
      secondaryOnPress: restartApp,
    );
  }
}

class SuccessStateRender extends StatelessWidget {
  const SuccessStateRender({
    super.key,
    required this.trackOrder,
    required this.backToHome,
  });

  final Function() trackOrder;
  final Function() backToHome;
  @override
  Widget build(BuildContext context) {
    return FullScreenDialogWidget(
      animationPath: Assets.animations.animationSuccess,
      title: AppStrings.yourOrderAccepted,
      message: AppStrings.yourItemsPlacedInWay,
      primaryButtonText: AppStrings.trackOrder,
      secondaryButtonText: AppStrings.backToHome,
      primaryOnPress: trackOrder,
      secondaryOnPress: backToHome,
    );
  }
}

class FullScreenDialogWidget extends StatelessWidget {
  final String animationPath;
  final String title;
  final String message;
  final String primaryButtonText;
  final String secondaryButtonText;

  final Function()? primaryOnPress;
  final Function()? secondaryOnPress;

  const FullScreenDialogWidget(
      {super.key,
      required this.animationPath,
      required this.title,
      required this.message,
      this.primaryOnPress,
      this.secondaryOnPress,
      required this.primaryButtonText,
      required this.secondaryButtonText});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(AppPadding.p20),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Lottie.asset(
                animationPath,
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: AppSize.s6),
            TextUtils(
              text: title,
              fontSize: FontSizes.f28,
              fontWe: FontWe.semiBold,
              maxLines: 2,
              color: context.isDark() ? AppColor.white : AppColor.strokeDark,
            ),
            const SizedBox(height: AppSize.s36),
            TextUtils(
              text: message,
              fontSize: FontSizes.f16,
              color: AppColor.grey7C,
              maxLines: 3,
            ),
            const SizedBox(height: AppSize.s40),
            CustomElevatedButton(
              text: primaryButtonText,
              onPressed: primaryOnPress,
            ),
            const SizedBox(height: AppSize.s25),
            CustomElevatedButton(
              elevation: 10.0,
              textColor: context.isDark() ? AppColor.white : AppColor.coffee,
              color: Theme.of(context).scaffoldBackgroundColor,
              text: secondaryButtonText,
              onPressed: secondaryOnPress,
            ),
          ],
        ),
      ),
    );
  }
}
