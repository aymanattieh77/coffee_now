import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';

import 'package:coffee_now/features/auth/presentaion/controllers/otp_vertification/otp_cubit.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/otp_vertification/custom_pincode_text_field.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/otp_vertification/timer_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class OTPVertificationScreen extends StatefulWidget {
  const OTPVertificationScreen({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<OTPVertificationScreen> createState() => _OTPVertificationScreenState();
}

class _OTPVertificationScreenState extends State<OTPVertificationScreen> {
  late final OTPCubit _optBloc;
  final _phoneController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _optBloc = BlocProvider.of<OTPCubit>(context);
    _optBloc.countdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: BlocListener<OTPCubit, OTPState>(
              listener: (context, state) {
                if (state is OTPFailure) {
                  _vertifyPhoneFailure(state.message);
                } else if (state is OTPSuccess) {
                  _vertifyPhoneSuccess();
                } else {
                  return;
                }
              },
              child: _otpBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _otpBody() {
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
        CustomPinCodeTextField(controller: _phoneController),
        const SizedBox(height: AppSize.s18),
        CountdownTimerWidget(
          durationInSeconds: 30,
          onTimerFinished: () {
            print("finshed");
          },
        ),
        const SizedBox(height: AppSize.s18),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextUtils(
              text: AppStrings.doNotSendOTP,
              color: AppColor.grey7C,
              fontWe: FontWe.semiBold,
            ),
            const SizedBox(width: AppSize.s3),
            BlocBuilder<OTPCubit, OTPState>(
              builder: (context, state) {
                bool isTimeout = (state is OTPTimeout);
                return InkWell(
                  onTap: isTimeout ? () {} : null,
                  child: TextUtils(
                    text: "Send OTP",
                    color: AppColor.oranage.withOpacity(isTimeout ? 1.0 : 0.3),
                    fontWe: FontWe.semiBold,
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: AppSize.s54),
        CustomElevatedButton(
          text: AppStrings.submit,
          onPressed: () {
            // _optBloc.vertifyPhoneNumber("+962 7 4541 9562	");
            AppRouter.pushNamed(
              context,
              routeName: Routes.home,
              replacement: true,
            );
          },
        ),
        const SizedBox(height: AppSize.s100),
      ],
    );
  }

  _vertifyPhoneSuccess() {
    showToastMessage(message: AppStrings.checkYourEmailAddress);
    AppRouter.pushNamed(
      context,
      routeName: Routes.home,
      replacement: true,
    );
  }

  _vertifyPhoneFailure(String error) {
    showToastMessage(message: error);
  }

  @override
  void dispose() {
    // _optBloc.dispose();
    super.dispose();
  }
}
