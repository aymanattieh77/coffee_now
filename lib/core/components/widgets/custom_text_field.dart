import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextUtils(text: AppStrings.email, color: AppColor.grey7D),
          const SizedBox(height: AppSize.s6),
          TextFormField(
            maxLines: 1,
            textDirection: context.isArabicLocale()
                ? TextDirection.rtl
                : TextDirection.ltr,
            decoration: InputDecoration(
              filled: true,
              fillColor: context.isDark()
                  ? AppColor.fillFieldDark
                  : AppColor.fillField,
              hintStyle: TextStyle(
                color: context.isDark()
                    ? AppColor.hintFieldDark
                    : AppColor.hintField,
                fontSize: FontSizes.f14,
              ),
              hintText: "Username@Example.com",
              border: _border(),
              enabledBorder: _border(),
              focusedBorder: _border(),
            ),
          ),
        ],
      ),
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
