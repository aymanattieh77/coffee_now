import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/core/components/widgets/custom_elevated_button.dart';
import 'package:coffee_now/core/components/widgets/text_utils.dart';
import 'package:coffee_now/core/extensions/context_extensions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/address/presentaion/widgets/address_card.dart';
import 'package:coffee_now/features/cart/presentaion/widgets/cart_item.dart';
import 'package:coffee_now/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            OrderDetailsAppbar(),
            OrderDeliverySection(),
            OrderSummarySection(),
            PaymentDetailSection(),
          ],
        ),
      ),
      bottomNavigationBar: PlaceOrderButton(),
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p20),
      color: context.isDark() ? AppColor.darkContainer : AppColor.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              TextUtils(text: AppStrings.total),
              Spacer(),
              TextUtils(text: "\$10.00", color: AppColor.oranage),
            ],
          ),
          const SizedBox(height: AppSize.s5),
          CustomElevatedButton(
            text: AppStrings.placeOrder,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class PaymentDetailSection extends StatelessWidget {
  const PaymentDetailSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelContainer(title: AppStrings.paymentDetails),
          const SizedBox(height: AppSize.s10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Row(
              children: [
                SizedBox(
                  height: AppSize.s40,
                  width: AppSize.s40,
                  child: SvgPicture.asset(Assets.icons.cash),
                ),
                const SizedBox(width: AppSize.s10),
                const TextUtils(text: AppStrings.cash),
                const Spacer(),
                Radio(value: true, groupValue: true, onChanged: (va) {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Row(
              children: [
                SizedBox(
                    height: AppSize.s40,
                    width: AppSize.s40,
                    child: SvgPicture.asset(Assets.icons.paymentMethods)),
                const SizedBox(width: AppSize.s10),
                const TextUtils(text: AppStrings.creditDebitCard),
                const Spacer(),
                Radio(
                  value: false,
                  groupValue: false,
                  onChanged: (va) {},
                ),
              ],
            ),
          ),

          //TODO Add Coupon Field

          const SizedBox(height: AppSize.s100),
        ],
      ),
    );
  }
}

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelContainer(title: AppStrings.orderSummary),
          SizedBox(height: AppSize.s10),
          ItemCart(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Column(
              children: [
                Row(
                  children: [
                    TextUtils(
                      text: AppStrings.subtotal,
                      fontWe: FontWe.regular,
                    ),
                    Spacer(),
                    TextUtils(text: "\$5.00", fontWe: FontWe.regular),
                  ],
                ),
                Row(
                  children: [
                    TextUtils(
                      text: AppStrings.deliveryFee,
                      fontWe: FontWe.regular,
                      color: AppColor.oranage,
                    ),
                    Spacer(),
                    TextUtils(
                      text: "\$5.00",
                      fontWe: FontWe.regular,
                      color: AppColor.oranage,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OrderDeliverySection extends StatelessWidget {
  const OrderDeliverySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelContainer(title: AppStrings.deliveryTo),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: AddressCard(),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Row(
              children: [
                SizedBox(
                  width: AppSize.s36,
                  height: AppSize.s36,
                  child: SvgPicture.asset(
                    Assets.icons.delivery,
                    colorFilter: const ColorFilter.mode(
                      AppColor.oranage,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: AppSize.s16),
                const TextUtils(
                  text: AppStrings.delivery, //TODO get Street Nam
                ),
                const Spacer(),
                const TextUtils(
                  text: AppStrings.changeOptions,
                  color: AppColor.oranage,
                  fontSize: FontSizes.f12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LabelContainer extends StatelessWidget {
  const LabelContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: AlignmentDirectional.topStart,
      color: context.isDark() ? AppColor.darkContainer : AppColor.whiteF5,
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20, vertical: AppPadding.p10),
      child: TextUtils(text: title, color: AppColor.grey7D),
    );
  }
}

class OrderDetailsAppbar extends StatelessWidget {
  const OrderDetailsAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
        child: BackCircleButton(),
      ),
      elevation: AppSize.s10,
      stretch: true,
      centerTitle: true,
      pinned: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextUtils(
            text: "Starbucks - CSB Mall", //TODO get Coffee Shop name
            color: context.isDark() ? AppColor.white : AppColor.coffee,
            fontSize: FontSizes.f16,
          ),
          const SizedBox(height: AppSize.s3),
          const TextUtils(
            text: "Distance from you: 1.2 km", //TODO get Distance from you
            color: AppColor.greyAA,
            fontSize: FontSizes.f12,
          ),
        ],
      ),
    );
  }
}
