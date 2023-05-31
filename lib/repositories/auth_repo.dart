import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roommate/app.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/models/profile/profile_model.dart';

/// [AuthRepo] hold abstraction for authorization
abstract class AuthRepo {
  Future<void> signInWithGoogle(
      {required Function(String, ProfileModel) onSuccess,
      required Function onFail});

  Future<void> signInWithFacebook(
      {required Function(String, ProfileModel) onSuccess,
      required Function onFail});

  Future<void> clearStorageData();

  Future<void> saveLanguageCode({required String languageCode});

  Future<String?> getLanguageCode();
}

/// [AuthRepoImp] hold logic for authorization
class AuthRepoImp implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SharedPreferencesHelper sharedPreferencesHelper;

  AuthRepoImp({required this.sharedPreferencesHelper});

  @override
  Future<void> signInWithGoogle(
      {required Function(String, ProfileModel) onSuccess,
      required Function onFail}) async {
    await GoogleSignIn().signOut();
    ProfileModel profileModel = ProfileModel();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: [
          'email',
        ],
      ).signIn();
      logger.i(googleUser.toString());
      profileModel = ProfileModel(
        name: googleUser?.displayName,
        mail: googleUser?.email,
        id: googleUser?.id,
        image: googleUser?.photoUrl,
      );
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final authResult = await _firebaseAuth.signInWithCredential(credential);
      onSuccess(authResult.credential?.accessToken ?? '', profileModel);
    } catch (e) {
      logger.e(e);
      onFail();
    }
  }

  @override
  Future<void> signInWithFacebook(
      {required Function(String, ProfileModel) onSuccess,
      required Function onFail}) async {
    final fb = FacebookAuth.instance;
    await fb.logOut();
    ProfileModel profileModel = ProfileModel();
    try {
      /// Requests from user [email] and [public_profile] that includes name
      final LoginResult result =
          await fb.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        logger.i(result.message);
        final _facebookUser = await fb.getUserData(fields: "name,email");
        logger.i(jsonEncode(_facebookUser));
        profileModel = ProfileModel(
          name: _facebookUser['name'],
          mail: _facebookUser['email'],
          id: _facebookUser['id'],
        );
        final facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken?.token ?? '');

        final authResult =
            await _firebaseAuth.signInWithCredential(facebookAuthCredential);
        onSuccess(authResult.credential?.accessToken ?? '', profileModel);
      } else {
        onFail();
        logger.e(
            "Authentication Failed: ${result.status} with message: ${result.message}");
      }
    } catch (e) {
      onFail();
      logger.e(e);
    }
  }

  @override
  Future<void> clearStorageData() async {
    await sharedPreferencesHelper.preferences.clear();
  }

  @override
  Future<void> saveLanguageCode({required String languageCode}) async {
    await sharedPreferencesHelper.saveLanguage(languageCode);
  }

  @override
  Future<String?> getLanguageCode() async {
    return sharedPreferencesHelper.getLanguageCode();
  }
}
