import 'package:coffee_now/core/components/state_renderer/show_state_renderer.dart';

import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_viewmodel.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/login/forget_password_with_account.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/login/or_divider.dart';
import 'package:flutter/material.dart';

import 'package:coffee_now/core/components/widgets/applogo_with_label.dart';
import 'package:coffee_now/core/components/widgets/custom_text_field.dart';
import 'package:coffee_now/core/components/widgets/widgets.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/auth/presentaion/widgets/login/google_facebook_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.start(context);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  viewModel.loginFailure(state.message);
                } else if (state is LoginLoading) {
                  ShowStateRenderer.loading(context);
                } else if (state is LoginSuccess) {
                  viewModel.loginSuccess(state.userUid);
                } else {
                  return;
                }
              },
              child: _loginBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginBody() {
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          const SizedBox(height: AppSize.s8),
          const AppLogoWithLabel(label: AppStrings.login),
          const SizedBox(height: AppSize.s30),
          CustomTextField(
            controller: viewModel.emailController,
            hint: "email@example.com",
            label: AppStrings.email,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: AppSize.s28),
          CustomTextField(
            controller: viewModel.passwordController,
            hint: "**********",
            label: AppStrings.password,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: AppSize.s10),
          forgetPassword(context),
          const SizedBox(height: AppSize.s25),
          CustomElevatedButton(
            text: AppStrings.login,
            onPressed: viewModel.login,
          ),
          const SizedBox(height: AppSize.s20),
          dontHaveAccount(context),
          const SizedBox(height: AppSize.s36),
          const OrDivider(),
          const SizedBox(height: AppSize.s30),
          const GoogleFacebookSignIn(),
          const SizedBox(height: AppSize.s88),
        ],
      ),
    );
  }
}
