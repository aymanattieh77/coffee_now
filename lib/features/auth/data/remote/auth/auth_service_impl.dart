import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:coffee_now/core/errors/exceptions.dart';
import 'package:coffee_now/core/resources/resources.dart';
import 'package:coffee_now/features/auth/data/remote/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  String? get getUserId => _firebaseAuth.currentUser?.uid;

  @override
  Future<String?> loginFirebase(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException(AppStrings.userNotFound);
      } else if (e.code == 'wrong-password') {
        throw AuthException(AppStrings.wrongPassword);
      }
    } catch (e) {
      throw AuthException(e.toString());
    }
    return null;
  }

  @override
  Future<void> reAuthenticatesUser(String email, String password) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await user.reauthenticateWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<String?> signInWithFacebook() async {
    // TODO: implement signInWithFacebook
    return null;
  }

  @override
  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      // Once signed in, return the UserCredential
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> signOutFirebase() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<String?> singUpFirebase(
      String username, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(username);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException(AppStrings.passwordProvidedWeak);
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(AppStrings.accountAlreadyExists);
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    String verificationId = "";
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification if the device automatically detects the SMS code
          print("Phone number verified automatically");
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            throw AuthException(AppStrings.invaildPhoneNumber);
          }
          throw AuthException(e.message ?? e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    try {
      await _firebaseAuth.currentUser?.updateEmail(newEmail);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> updateUsername(String newUsername) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(newUsername);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? e.toString());
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
