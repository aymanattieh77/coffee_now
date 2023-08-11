import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/core/components/state_renderer/show_state_renderer.dart';
import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/register/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterFailure) {
                  _registerFailure(state.message);
                } else if (state is RegisterLoading) {
                  ShowStateRenderer.loading(context);
                } else if (state is RegisterSuccess) {
                  _registerSuccess();
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
      key: _registerBloc.formKey,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s8),
          const AppLogoWithLabel(label: AppStrings.register),
          const SizedBox(height: AppSize.s30),
          CustomTextField(
            controller: _registerBloc.usernameController,
            hint: "Someone",
            label: AppStrings.username,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: AppSize.s28),
          CustomTextField(
            controller: _registerBloc.emailController,
            hint: "email@example.com",
            label: AppStrings.email,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSize.s28),
          CustomTextField(
            controller: _registerBloc.phoneController,
            hint: "+962 10 digits",
            label: AppStrings.phone,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: AppSize.s28),
          CustomTextField(
            controller: _registerBloc.passwordController,
            hint: "**********",
            label: AppStrings.password,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: AppSize.s30),
          CustomElevatedButton(
            text: AppStrings.register,
            onPressed: _register,
          ),
          const SizedBox(height: AppSize.s20),
          alreadyHaveAccount(),
          const SizedBox(height: AppSize.s60),
        ],
      ),
    );
  }

  Widget alreadyHaveAccount() {
    return InkWell(
      onTap: () {
        AppRouter.pushNamed(
          context,
          routeName: Routes.login,
          replacement: true,
        );
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: AppStrings.alreadyHaveAccount,
            color: AppColor.grey7D,
          ),
          SizedBox(width: AppSize.s5),
          TextUtils(
            text: AppStrings.login,
            color: AppColor.oranage,
          )
        ],
      ),
    );
  }

  _register() {
    _registerBloc.register();
  }

  _registerSuccess() {
    dismissDialog(context);
    // AppRouter.push(context, OTPVerificationScreen(phoneNumber :_registerBloc.phoneController.text));
  }

  _registerFailure(String error) {
    dismissDialog(context);
    showToastMessage(message: error);
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}
