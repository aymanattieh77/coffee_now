import 'package:coffee_now/config/routes/app_router.dart';

import 'package:coffee_now/features/address/presentaion/screens/edit_address_screen.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        AppRouter.push(context, const EditAddressScreen());
      },
      child: SvgPicture.asset(Assets.icons.addCircle),
    );
  }
}
