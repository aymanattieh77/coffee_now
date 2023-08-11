part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String userUid;
  const RegisterSuccess(this.userUid);
}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);
}
