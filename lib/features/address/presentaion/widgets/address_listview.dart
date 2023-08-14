import 'package:coffee_now/features/address/presentaion/widgets/address_card.dart';
import 'package:flutter/material.dart';

class AddressListview extends StatelessWidget {
  const AddressListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return const AddressCard(); //TODO GET Saved Address
      },
    );
  }
}
