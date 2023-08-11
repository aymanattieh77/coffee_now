import 'package:coffee_now/core/errors/failures.dart';
import 'package:coffee_now/core/utils/usecase.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUsecase extends BaseUsecase<String, RegisterInputs> {
  final AuthRepository _repository;
  RegisterUsecase(this._repository);
  @override
  Future<Either<Failure, String>> call(RegisterInputs param) async {
    return await _repository.singUpFirebase(
        param.username, param.email, param.password);
  }
}

class RegisterInputs {
  final String username;
  final String email;
  final String password;
  RegisterInputs(this.username, this.email, this.password);
}
