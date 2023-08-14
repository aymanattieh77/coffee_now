import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/custom_appbar.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/profile/presentaion/widgets/profile_picture.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    usernameController.text = "Ayman";
    emailController.text = "ayman@gmail.com";
    phoneController.text = "0776682504";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.account),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: AppSize.s25),
                const ProfilePicture(),
                const SizedBox(height: AppSize.s20),
                CustomTextField(
                  controller: usernameController,
                  hint: "",
                  label: AppStrings.username,
                ),
                const SizedBox(height: AppSize.s20),
                CustomTextField(
                  controller: emailController,
                  hint: "",
                  label: AppStrings.email,
                ),
                const SizedBox(height: AppSize.s20),
                CustomTextField(
                  controller: phoneController,
                  hint: "",
                  label: AppStrings.phoneNumber,
                ),
                const SizedBox(height: AppSize.s40),
                CustomElevatedButton(
                  color: AppColor.whiteE9,
                  textColor: AppColor.red,
                  text: AppStrings.update,
                  onPressed: () {}, //Todo Update account info
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
