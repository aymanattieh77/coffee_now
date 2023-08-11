import 'package:dartz/dartz.dart';

import 'package:coffee_now/core/errors/failures.dart';
import 'package:coffee_now/core/utils/usecase.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';

class VertifyPhoneUsecase extends BaseUsecase<void, String> {
  final AuthRepository _repository;
  VertifyPhoneUsecase(this._repository);
  @override
  Future<Either<Failure, void>> call(String param) async {
    return await _repository.verifyPhoneNumber(param);
  }
}
