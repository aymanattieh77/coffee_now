import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/string_extensions.dart';
import 'package:coffee_now/core/resources/colors.dart';
import 'package:coffee_now/core/resources/strings.dart';
import 'package:coffee_now/core/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    useSafeArea: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

void showToastMessage({required String message}) async {
  await Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColor.oranage,
    fontSize: FontSizes.f14,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

void showSnackMessage(BuildContext context,
    {required String message, required Function() undoPress}) {
  final SnackBar snackBar = SnackBar(
    content: TextUtils(text: message, color: Colors.white),
    backgroundColor: AppColor.oranage,
    // showCloseIcon: true,
    //closeIconColor: AppColor.white,
    action: SnackBarAction(
      label: "Undo",
      onPressed: undoPress,
      textColor: AppColor.whiteE9,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String? formVaildation(String? value, TextInputType type) {
  if (value == null || value.isEmpty) {
    return AppStrings.pleaseFillTheField;
  }
  switch (type) {
    case TextInputType.phone:
      return value.validatePhoneNumber(value);
    case TextInputType.emailAddress:
      return value.validateEmail(value);
    case TextInputType.name:
      return value.validateUsername(value);
    case TextInputType.visiblePassword:
      return value.validatePassword(value);
  }
  return null;
}
