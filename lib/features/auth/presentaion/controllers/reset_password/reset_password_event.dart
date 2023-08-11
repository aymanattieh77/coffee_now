part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetPasswordTiggerEvent extends ResetPasswordEvent {
  final String email;
  const ResetPasswordTiggerEvent(this.email);
}
