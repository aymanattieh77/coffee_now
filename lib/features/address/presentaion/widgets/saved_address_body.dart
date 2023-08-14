import 'package:coffee_now/features/address/presentaion/widgets/address_listview.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/address/presentaion/widgets/custom_address_appbar.dart';

class SavedAddressBody extends StatelessWidget {
  const SavedAddressBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: Column(
        children: [
          SizedBox(height: AppSize.s8),
          CustomAddressAppbar(),
          SizedBox(height: AppSize.s16),
          Expanded(child: AddressListview()),
        ],
      ),
    );
  }
}
