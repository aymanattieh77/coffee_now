import 'package:coffee_now/features/auth/data/remote/auth/auth_service.dart';

abstract class AuthRemoteDataSource {
  Future<String?> singUpFirebase(
      String username, String email, String password);
  Future<String?> loginFirebase(String email, String password);
  Future<void> signOutFirebase();
  Future<String?> signInWithGoogle();
  Future<String?> signInWithFacebook();
  Future<void> verifyPhoneNumber(String phone);
  Future<void> resetPassword(String email);
  Future<void> updatePassword(String newPassword);
  Future<void> updateEmail(String newEmail);
  Future<void> updateUsername(String newUsername);
  Future<void> sendEmailVerification();
  Future<void> reAuthenticatesUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _authService;
  AuthRemoteDataSourceImpl(this._authService);
  @override
  Future<String?> loginFirebase(String email, String password) async {
    return await _authService.loginFirebase(email, password);
  }

  @override
  Future<void> reAuthenticatesUser(String email, String password) async {
    return await _authService.reAuthenticatesUser(email, password);
  }

  @override
  Future<void> resetPassword(String email) async {
    return await _authService.resetPassword(email);
  }

  @override
  Future<void> sendEmailVerification() async {
    return await _authService.sendEmailVerification();
  }

  @override
  Future<String?> signInWithFacebook() async {
    return await _authService.signInWithFacebook();
  }

  @override
  Future<String?> signInWithGoogle() async {
    return await _authService.signInWithGoogle();
  }

  @override
  Future<void> signOutFirebase() {
    return _authService.signOutFirebase();
  }

  @override
  Future<String?> singUpFirebase(
      String username, String email, String password) async {
    return _authService.singUpFirebase(username, email, password);
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    return await _authService.updateEmail(newEmail);
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    return await _authService.updatePassword(newPassword);
  }

  @override
  Future<void> updateUsername(String newUsername) async {
    return await _authService.updateUsername(newUsername);
  }

  @override
  Future<void> verifyPhoneNumber(String phone) async {
    return await _authService.verifyPhoneNumber(phone);
  }
}
