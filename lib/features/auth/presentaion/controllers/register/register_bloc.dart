import 'dart:async';
import 'package:coffee_now/features/auth/domain/usecases/register_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase _registerUsecase;
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  RegisterBloc(this._registerUsecase) : super(RegisterInitial()) {
    on<RegisterFirebaseEvent>(_register);
  }

  void register() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      add(RegisterFirebaseEvent(usernameController.text, emailController.text,
          passwordController.text));
    }
  }

  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  FutureOr<void> _register(
      RegisterFirebaseEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    (await _registerUsecase
            .call(RegisterInputs(event.username, event.email, event.password)))
        .fold(
      (failure) {
        emit(RegisterFailure(failure.message));
      },
      (userUid) {
        emit(RegisterSuccess(userUid));
      },
    );
  }
}
