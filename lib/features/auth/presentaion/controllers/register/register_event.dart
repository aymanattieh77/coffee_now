part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterFirebaseEvent extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  const RegisterFirebaseEvent(this.username, this.email, this.password);
}
