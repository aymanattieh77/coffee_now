import 'package:coffee_now/core/functions/functions.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.inputType = TextInputType.text,
    required this.hint,
    this.controller,
    required this.label,
    this.validator,
  });
  final TextInputType inputType;
  final String hint;
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(text: widget.label, color: AppColor.grey7D),
          const SizedBox(height: AppSize.s6),
          TextFormField(
            controller: widget.controller,
            obscureText: isPasswordField ? isObsecure : false,
            keyboardType: widget.inputType,
            maxLines: 1,
            textDirection: context.isArabicLocale()
                ? TextDirection.rtl
                : TextDirection.ltr,
            decoration: _inputDecoration(),
            validator: (value) {
              return formVaildation(value, widget.inputType);
            },
          ),
        ],
      ),
    );
  }

  bool get isPasswordField => widget.inputType == TextInputType.visiblePassword;

  Widget? visiblityIcon() {
    if (isPasswordField) {
      return IconButton(
        onPressed: _showPassword,
        icon: Icon(
          isObsecure ? Icons.visibility_off : Icons.visibility,
        ),
      );
    }
    return null;
  }

  _showPassword() {
    isObsecure = !isObsecure;
    setState(() {});
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: context.isDark() ? AppColor.fillFieldDark : AppColor.fillField,
      hintStyle: TextStyle(
        color: context.isDark() ? AppColor.hintFieldDark : AppColor.hintField,
        fontSize: FontSizes.f14,
      ),
      errorMaxLines: 3,
      hintText: widget.hint,
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(),
      suffixIcon: visiblityIcon(),
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color:
            context.isDark() ? AppColor.strokeFieldDark : AppColor.strokeField,
      ),
    );
  }
}
