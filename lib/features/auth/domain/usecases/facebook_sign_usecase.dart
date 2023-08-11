import 'package:coffee_now/core/errors/failures.dart';
import 'package:coffee_now/core/utils/usecase.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class FacebookSignUsecase extends BaseUsecase<String, NoParam> {
  final AuthRepository _repository;
  FacebookSignUsecase(this._repository);
  @override
  Future<Either<Failure, String>> call(NoParam param) async {
    return await _repository.signInWithFacebook();
  }
}
