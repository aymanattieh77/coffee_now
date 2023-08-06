import 'package:flutter/material.dart';

void dismissDialog(BuildContext context) {
  if (_isCurrentDialogShowing(context)) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}

bool _isCurrentDialogShowing(BuildContext context) {
  return ModalRoute.of(context)?.isCurrent != true;
}

showCustomBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    builder: (context) => child,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).cardColor,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

// void showSnackMessage(BuildContext context, {required String message}) {
//   final SnackBar snackBar = SnackBar(
//     content: TextUtils(text: message, color: Colors.white),
//     backgroundColor: AppColor.orange,
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }