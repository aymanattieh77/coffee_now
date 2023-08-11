import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/components/widgets/back_button.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/otp_vertification/otp_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/otp_vertification/timer_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVertificationScreen extends StatefulWidget {
  const OTPVertificationScreen({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<OTPVertificationScreen> createState() => _OTPVertificationScreenState();
}

class _OTPVertificationScreenState extends State<OTPVertificationScreen> {
  late final OTPBloc _optBloc;

  @override
  void initState() {
    super.initState();
    _optBloc = BlocProvider.of<OTPBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: BlocListener<OTPBloc, bool>(
              listener: (context, state) {
                // if (state is ResetPasswordFailure) {
                //   _resetPasswordFailure(state.message);
                // } else if (state is ResetPasswordSuccess) {
                //   _resetPasswordSuccess();
                // } else {
                //   return;
                // }
              },
              child: _registerBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerBody() {
    return Column(
      children: [
        const SizedBox(height: AppSize.s8),
        const AppLogoWithLabel(label: AppStrings.otpVerification),
        const SizedBox(height: AppSize.s40),
        const TextUtils(
          text: AppStrings.weWillSendOneTimePassword,
          maxLines: 2,
        ),
        const TextUtils(
          text: AppStrings.mobileNumber,
          fontWe: FontWe.semiBold,
        ),
        const SizedBox(height: AppSize.s18),
        TextUtils(
          text: "+962 ${widget.phoneNumber}",
          tr: false,
          fontWe: FontWe.semiBold,
        ),
        const SizedBox(height: AppSize.s20),
        PinCodeTextField(
          appContext: context,
          length: 4,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            print(value);
          },
          onCompleted: (value) {
            print("Complete");
          },
          pinTheme: PinTheme(
            activeColor: AppColor.greyAA,
            activeFillColor: AppColor.whiteF5,
            shape: PinCodeFieldShape.circle,
          ),
        ),
        const SizedBox(height: AppSize.s18),
        // const TextUtils(
        //   text: "00:30",
        //   color: AppColor.greyAA,
        //   fontWe: FontWe.semiBold,
        // ),
        const TimerCountDown(seconds: 30),
        const SizedBox(height: AppSize.s18),
        const TextUtils(
          text: AppStrings.doNotSendOTP,
          color: AppColor.grey7C,
          fontWe: FontWe.semiBold,
        ),
        const SizedBox(height: AppSize.s54),
        CustomElevatedButton(
          text: AppStrings.resetPassword,
          onPressed: () {},
        ),
        const SizedBox(height: AppSize.s100),
      ],
    );
  }

  _resetPasswordSuccess() {
    showToastMessage(message: AppStrings.checkYourEmailAddress);
    AppRouter.pop(context);
  }

  _resetPasswordFailure(String error) {
    dismissDialog(context);
    showToastMessage(message: error);
  }

  @override
  void dispose() {
    // _optBloc.dispose();
    super.dispose();
  }
}
