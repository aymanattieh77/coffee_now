import 'package:coffee_now/core/components/dialogs/dialogs.dart';
import 'package:coffee_now/core/components/state_renderer/state_renderers.dart';
import 'package:flutter/material.dart';

class ShowStateRenderer {
  //

  ShowStateRenderer.error(
    BuildContext context,
    String errorMessage,
    Function() tryAgain,
    Function() restartApp,
  ) {
    showFullScreenDialog(
      context,
      ErrorStateRender(
        errorMessage: errorMessage,
        tryAgain: tryAgain,
        restartApp: restartApp,
      ),
    );
  }

  ShowStateRenderer.success(
    BuildContext context, {
    required Function() trackOrder,
    required Function() backToHome,
  }) {
    showFullScreenDialog(
      context,
      SuccessStateRender(
        trackOrder: trackOrder,
        backToHome: backToHome,
      ),
    );
  }
  ShowStateRenderer.loading(BuildContext context) {
    showFullScreenDialog(
      context,
      const LoadingStateRender(),
    );
  }
}
