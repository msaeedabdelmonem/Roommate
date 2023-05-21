import 'package:roommate/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper({required this.preferences});

  final SharedPreferences preferences;

  /// Saves the token
  Future<bool> saveToken(String token) async {
    return await preferences.setString(
        SharedPrefsConstants.token, token);
  }

  /// fetching token from shared preferences
  Future<String?> getToken() async {
    return preferences.getString(SharedPrefsConstants.token);
  }
}
