import 'package:coffee_now/core/errors/exceptions.dart';
import 'package:coffee_now/core/errors/failures.dart';
import 'package:coffee_now/core/resources/strings.dart';
import 'package:coffee_now/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:coffee_now/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;
  AuthRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, String>> loginFirebase(
      String email, String password) async {
    try {
      final userUId = await _dataSource.loginFirebase(email, password);
      if (userUId == null) {
        return const Left(FirebaseFailure(AppStrings.unknownError));
      }
      return Right(userUId);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> reAuthenticatesUser(
      String email, String password) {
    // TODO: implement reAuthenticatesUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _dataSource.resetPassword(email);

      return const Right(Void);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signInWithFacebook() async {
    try {
      final userUid = await _dataSource.signInWithFacebook();
      if (userUid == null) {
        return const Left(FirebaseFailure(AppStrings.unknownError));
      }
      return Right(userUid);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> signInWithGoogle() async {
    try {
      final userUid = await _dataSource.signInWithGoogle();
      if (userUid == null) {
        return const Left(FirebaseFailure(AppStrings.unknownError));
      }
      return Right(userUid);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> signOutFirebase() async {
    // TODO: implement signOutFirebase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> singUpFirebase(
      String username, String email, String password) async {
    try {
      final userUId =
          await _dataSource.singUpFirebase(username, email, password);
      if (userUId == null) {
        return const Left(FirebaseFailure(AppStrings.unknownError));
      }
      return Right(userUId);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateEmail(String newEmail) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateUsername(String newUsername) {
    // TODO: implement updateUsername
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyPhoneNumber(String phone) async {
    try {
      await _dataSource.verifyPhoneNumber(phone);

      return const Right(Void);
    } on AuthException catch (e) {
      return Left(FirebaseFailure(e.message));
    }
  }
}

class Void {}
