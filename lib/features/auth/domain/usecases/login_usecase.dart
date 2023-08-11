import 'package:coffee_now/core/errors/failures.dart';
import 'package:coffee_now/core/utils/usecase.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends BaseUsecase<String, LoginInputs> {
  final AuthRepository _repository;
  LoginUsecase(this._repository);
  @override
  Future<Either<Failure, String>> call(LoginInputs param) async {
    return await _repository.loginFirebase(param.email, param.password);
  }
}

class LoginInputs {
  final String email;
  final String password;
  LoginInputs(this.email, this.password);
}
