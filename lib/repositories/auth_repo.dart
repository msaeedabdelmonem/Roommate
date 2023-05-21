import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roommate/app.dart';

/// [AuthRepo] hold abstraction for authorization
abstract class AuthRepo {
  Future<void> signInWithGoogle({required Function(String) onSuccess,required Function onFail});
}

/// [AuthRepoImp] hold logic for authorization
class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> signInWithGoogle({required Function(String) onSuccess,required Function onFail}) async {
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
}
