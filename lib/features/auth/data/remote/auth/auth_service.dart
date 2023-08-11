abstract class AuthService {
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
  String? get getUserId;
}
