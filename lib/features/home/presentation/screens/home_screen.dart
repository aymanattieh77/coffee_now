import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';

import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.red,
      body: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppLogoWithLabel(label: AppStrings.login),
              SizedBox(height: AppSize.s36),
              // CustomTextField(),
              SizedBox(height: AppSize.s28),
              // CustomTextField(),
            ],
          ),
        ),
        floatingActionButton: FloatingBasketButton(),
      ),
      floatingActionButton: CustomBottomNavigationBar(currentIndex: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


// Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     alignment: Alignment.center,
//     child: CustomElevatedButton(
//       text: AppStrings.account,
//       onPressed: () {
//         //showToastMessage(message: "Hey I'am Ayman Attieh");
//         showSnackMessage(
//           context,
//           message: "Hey I'am Ayman Attieh",
//           undoPress: () {},
//         );
//       },
//     ),
//   ),
//   const SizedBox(height: 40),
//   const AppLogoWithLabel(label: AppStrings.login),
//   const AppLogoWithLabel(label: AppStrings.register),
