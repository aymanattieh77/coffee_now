import 'dart:async';

import 'package:coffee_now/features/auth/domain/usecases/veritfy_phone_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPCubit extends Cubit<OTPState> {
  OTPCubit(this._vertifyPhoneUsecase) : super(OTPInital());
  int timeoutSeconds = 30;
  final VertifyPhoneUsecase _vertifyPhoneUsecase;

  Future<void> countdownTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeoutSeconds == 0) {
        timer.cancel();
        // completed
        emit(OTPTimeout());
      } else {
        timeoutSeconds--;
      }
    }).tick;
  }

  Future<void> vertifyPhoneNumber(String phonenumber) async {
    (await _vertifyPhoneUsecase.call(phonenumber)).fold(
      (failure) {
        emit(OTPFailure(failure.message));
      },
      (_) {
        emit(OTPSuccess());
      },
    );
  }

  submit() {}
}

abstract class OTPState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OTPInital extends OTPState {}

class OTPTimeout extends OTPState {}

class OTPSuccess extends OTPState {}

class OTPFailure extends OTPState {
  final String message;
  OTPFailure(this.message);
}
