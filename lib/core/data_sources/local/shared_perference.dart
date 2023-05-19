import 'package:roommate/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper({required this.preferences});

  final SharedPreferences preferences;

  /// Saves the onBoarding state so the user is only presented with onBoarding screen once
  Future<bool> saveOnBoardingState(String token) async {
    return await preferences.setString(
        SharedPrefsConstants.onBoardingState, token);
  }

  /// fetching OnBoardingState from shared preferences
  Future<String?> getOnBoardingState() async {
    return preferences.getString(SharedPrefsConstants.onBoardingState);
  }
}
