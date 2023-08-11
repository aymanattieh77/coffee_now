part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFirebase extends LoginEvent {
  final String email;
  final String password;
  const LoginFirebase(this.email, this.password);
}

class GoogleSign extends LoginEvent {}

class FacebookSign extends LoginEvent {}
