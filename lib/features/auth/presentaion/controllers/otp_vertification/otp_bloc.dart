import 'dart:async';
import 'package:coffee_now/features/auth/domain/usecases/auth_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum OtpEvent { submit }

class OTPBloc extends Bloc<OtpEvent, bool> {
  final VertifyPhoneUsecase _vertifyPhoneUsecase;
  OTPBloc(this._vertifyPhoneUsecase) : super(false) {
    on<OtpEvent>(_vertifyPhoneNumber);
  }

  FutureOr<void> _vertifyPhoneNumber(event, emit) async {}

  Stream<bool> mapEventToState(OtpEvent event) async* {
    if (event == OtpEvent.submit) {
      // Replace this with your OTP verification logic
      // Simulate a successful verification for demonstration purposes
      await Future.delayed(const Duration(seconds: 2));
      yield true;
    }
  }
}
