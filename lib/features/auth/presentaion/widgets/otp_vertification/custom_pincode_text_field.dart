import 'package:coffee_now/core/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: 4,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        print(value);
      },
      onCompleted: (value) {
        print("Complete");
      },
      pinTheme: PinTheme(
        activeColor: AppColor.greyAA,
        activeFillColor: AppColor.whiteF5,
        shape: PinCodeFieldShape.circle,
      ),
    );
  }
}
