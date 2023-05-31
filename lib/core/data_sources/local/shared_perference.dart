import 'dart:convert';

import 'package:roommate/core/constants/storage_keys.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper({required this.preferences});

  final SharedPreferences preferences;

  /// Saves the token
  Future<bool> saveToken(String token) async {
    return await preferences.setString(
        SharedPrefsConstants.token, token);
  }
  /// Save user data
  Future<bool> saveUserData(ProfileModel profileModel) async {
    return await preferences.setString(
        SharedPrefsConstants.userData, jsonEncode(profileModel));
  }
  /// Save language
  Future<bool> saveLanguage(String languageCode) async {
    return await preferences.setString(
        SharedPrefsConstants.languageCode, languageCode);
  }
  /// fetching token from shared preferences
  Future<String?> getToken() async {
    return preferences.getString(SharedPrefsConstants.token);
  }
  /// fetching user data from shared preferences
  Future<String?> getUserData() async {
    return preferences.getString(SharedPrefsConstants.userData);
  }

  Future<String?> getLanguageCode() async {
    return preferences.getString(SharedPrefsConstants.languageCode);
  }
}
