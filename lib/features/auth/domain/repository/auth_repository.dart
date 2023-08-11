import 'package:coffee_now/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> singUpFirebase(
      String username, String email, String password);
  Future<Either<Failure, String>> loginFirebase(String email, String password);
  Future<Either<Failure, void>> signOutFirebase();
  Future<Either<Failure, String>> signInWithGoogle();
  Future<Either<Failure, String>> signInWithFacebook();
  Future<Either<Failure, void>> verifyPhoneNumber(String phone);
  Future<Either<Failure, void>> resetPassword(String email);
  Future<Either<Failure, void>> updatePassword(String newPassword);
  Future<Either<Failure, void>> updateEmail(String newEmail);
  Future<Either<Failure, void>> updateUsername(String newUsername);
  Future<Either<Failure, void>> sendEmailVerification();
  Future<Either<Failure, void>> reAuthenticatesUser(
      String email, String password);
}
