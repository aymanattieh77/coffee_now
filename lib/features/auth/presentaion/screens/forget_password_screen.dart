import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/core/components/widgets/back_circle_button.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/reset_password/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/resources.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final ResetPasswordBloc _resetPasswordBloc;

  @override
  void initState() {
    super.initState();
    _resetPasswordBloc = BlocProvider.of<ResetPasswordBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordFailure) {
                  _resetPasswordFailure(state.message);
                } else if (state is ResetPasswordSuccess) {
                  _resetPasswordSuccess();
                } else {
                  return;
                }
              },
              child: _registerBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerBody() {
    return Form(
      key: _resetPasswordBloc.formKey,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s8),
          const BackCircleButton(),
          const AppLogoWithLabel(label: AppStrings.forgetPassword),
          const SizedBox(height: AppSize.s6),
          const TextUtils(
            text: "We’ll send a password reset link to your email.",
            color: AppColor.greyAA,
            maxLines: 2,
          ),
          const SizedBox(height: AppSize.s20),
          CustomTextField(
            controller: _resetPasswordBloc.emailController,
            hint: "email@example.ocm",
            label: AppStrings.email,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSize.s40),
          CustomElevatedButton(
            text: AppStrings.resetPassword,
            onPressed: _resetPassword,
          ),
        ],
      ),
    );
  }

  _resetPassword() {
    _resetPasswordBloc.resetPassword();
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
    _resetPasswordBloc.dispose();
    super.dispose();
  }
}
