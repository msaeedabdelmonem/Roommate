import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roommate/app.dart';

/// [AuthRepo] hold abstraction for authorization
abstract class AuthRepo {
  Future<void> signInWithGoogle(
      {required Function(String) onSuccess, required Function onFail});

  Future<void> signInWithFacebook(
      {required Function(String) onSuccess, required Function onFail});
}

/// [AuthRepoImp] hold logic for authorization
class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithGoogle(
      {required Function(String) onSuccess, required Function onFail}) async {
    await GoogleSignIn().signOut();

    try {
      final GoogleSignInAccount? _googleUser = await GoogleSignIn(
        scopes: [
          'email',
        ],
      ).signIn();

      final GoogleSignInAuthentication googleAuth =
          await _googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final authResult = await _firebaseAuth.signInWithCredential(credential);
      onSuccess(authResult.credential?.accessToken ?? '');
    } catch (e) {
      logger.e(e);
      onFail();
      return null;
    }
  }

  @override
  Future<void> signInWithFacebook(
      {required Function(String) onSuccess, required Function onFail}) async {
    final fb = FacebookAuth.instance;
    await fb.logOut();
    try {
      /// Requests from user [email] and [public_profile] that includes name
      final LoginResult result =
          await fb.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        logger.i(result.message);
        final facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken?.token ?? '');

        final authResult = await _firebaseAuth.signInWithCredential(facebookAuthCredential);
        onSuccess(authResult.credential?.accessToken??'');
      } else {
        onFail();
        logger.e(
            "Authentication Failed: ${result.status} with message: ${result.message}");
        return null;
      }
    } catch (e) {
      onFail();
      logger.e(e);
      return null;
    }
  }
}
