import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';

class EditAddressBody extends StatelessWidget {
  const EditAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppLogoWithLabel(label: AppStrings.addressSetup),
              const SizedBox(height: AppSize.s36),
              const CustomTextField(
                  hint: AppStrings.address, label: AppStrings.addressLine1),
              const SizedBox(height: AppSize.s28),
              const CustomTextField(
                  hint: AppStrings.address, label: AppStrings.addressLine2),
              const SizedBox(height: AppSize.s28),
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                        hint: AppStrings.zipcode, label: AppStrings.zipcode),
                  ),
                  SizedBox(width: AppSize.s16),
                  Expanded(
                    child: CustomTextField(
                        hint: AppStrings.city, label: AppStrings.city),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s28),
              const CustomTextField(
                  hint: AppStrings.country, label: AppStrings.country),
              const SizedBox(height: AppSize.s28),
              CustomElevatedButton(
                text: AppStrings.addAddress,
                onPressed: () {},
              ),
              const SizedBox(height: AppSize.s28),
            ],
          ),
        ),
      ),
    );
  }
}
