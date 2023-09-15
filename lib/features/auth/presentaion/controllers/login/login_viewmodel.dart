import 'package:coffee_now/config/routes/app_router.dart';
import 'package:coffee_now/config/routes/routes.dart';
import 'package:coffee_now/config/service_locator/service_locator.dart';
import 'package:coffee_now/config/services/app_cahce.dart';
import 'package:coffee_now/core/functions/functions.dart';
import 'package:coffee_now/core/utils/base_viewmodel.dart';
import 'package:coffee_now/features/auth/presentaion/controllers/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel implements BaseViewModel {
  late LoginBloc _loginBloc;
  late BuildContext context;
  LoginViewModel();

  @override
  void dispose() {
    _loginBloc.dispose();
  }

  @override
  void start(BuildContext context) {
    this.context = context;
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  GlobalKey<FormState> get formKey => _loginBloc.formKey;
  TextEditingController get emailController => _loginBloc.emailController;
  TextEditingController get passwordController => _loginBloc.passwordController;
  void login() {
    _loginBloc.login();
  }

  void loginSuccess(String userUid) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getIt<AppCahce>().saveUserUid(userUid);
    });
    dismissDialog(context);
    AppRouter.pushNamed(context, routeName: Routes.home, replacement: true);
  }

  void loginFailure(String error) {
    dismissDialog(context);
    showToastMessage(message: error);
  }
}
