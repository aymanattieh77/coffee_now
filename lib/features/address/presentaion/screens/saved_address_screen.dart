import 'package:flutter/material.dart';

import 'package:coffee_now/features/address/presentaion/widgets/add_address_button.dart';
import 'package:coffee_now/features/address/presentaion/widgets/saved_address_body.dart';

class SavedAddressScreen extends StatelessWidget {
  const SavedAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SavedAddressBody(),
      ),
      floatingActionButton: AddAddressButton(),
    );
  }
}
