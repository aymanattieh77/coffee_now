import 'package:coffee_now/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<Output, Param> {
  Future<Either<Failure, Output>> call(Param param);
}

class NoParam extends Equatable {
  @override
  List<Object?> get props => [];
}
