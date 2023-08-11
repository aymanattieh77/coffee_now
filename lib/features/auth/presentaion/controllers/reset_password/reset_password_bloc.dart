import 'dart:async';
import 'package:coffee_now/features/auth/domain/usecases/auth_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUsecase _passwordUsecase;
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void resetPassword() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      add(ResetPasswordTiggerEvent(emailController.text.trim()));
    }
  }

  dispose() {
    emailController.dispose();
  }

  ResetPasswordBloc(this._passwordUsecase) : super(ResetPasswordInitial()) {
    on<ResetPasswordTiggerEvent>(_resetPassword);
  }

  FutureOr<void> _resetPassword(
      ResetPasswordTiggerEvent event, Emitter<ResetPasswordState> emit) async {
    emit(ResetPasswordLoading());
    final result = await _passwordUsecase.call(event.email);
    result.fold(
      (failure) {
        emit(ResetPasswordFailure(failure.message));
      },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
