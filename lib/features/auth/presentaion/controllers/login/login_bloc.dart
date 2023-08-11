import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:coffee_now/core/utils/usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/facebook_sign_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/google_sign_usecase.dart';
import 'package:coffee_now/features/auth/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;
  final GoogleSignUsecase _googleSignInUsecase;
  final FacebookSignUsecase _facebookSignUsecase;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      add(LoginFirebase(emailController.text, passwordController.text));
    }
  }

  LoginBloc(
      this._loginUsecase, this._googleSignInUsecase, this._facebookSignUsecase)
      : super(LoginInitial()) {
    on<LoginFirebase>(_login);
    on<GoogleSign>(_googleSignIn);
    on<FacebookSign>(_facebookSignIn);
  }

  FutureOr<void> _login(LoginFirebase event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    (await _loginUsecase.call(LoginInputs(event.email, event.password))).fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (userUid) {
        emit(LoginSuccess(userUid));
      },
    );
  }

  FutureOr<void> _googleSignIn(
      GoogleSign event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    (await _googleSignInUsecase.call(NoParam())).fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (userUid) {
        emit(LoginSuccess(userUid));
      },
    );
  }

  FutureOr<void> _facebookSignIn(
      FacebookSign event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    (await _facebookSignUsecase.call(NoParam())).fold(
      (failure) {
        emit(LoginFailure(failure.message));
      },
      (userUid) {
        emit(LoginSuccess(userUid));
      },
    );
  }

  dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
