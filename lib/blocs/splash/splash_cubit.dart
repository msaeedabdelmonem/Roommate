import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';

/// [SplashCubit] to get date before main screen then route
class SplashCubit extends Cubit<void> {
  SplashCubit({
    required this.authCubit,
    required this.sharedPreferencesHelper,
  }) : super(null);

  final AuthCubit authCubit;
  final SharedPreferencesHelper sharedPreferencesHelper;

  /// Emits initial [AuthState] to navigate user from splash page to corresponding
  /// page based on the emitted state.
  ///
  /// - [RootedState] & [JailBrokenState] => emitted when the user access the app
  /// from jailbroken / rooted device and exit user from app
  /// - [FirstTimeAccessState] => emitted when the user access the app for the
  /// first time and navigate to OnboardingPage.
  /// - [AuthorizedState] => emitted when the user is already signed before
  /// and navigates user to the home page directly (Autologin).
  /// - [UnauthorizedState] => emitted when the user is not logged in or not
  /// the first time to open the app and navigate user to the Login Page.
  Future<void> emitInitialAuthState() async {
    await Future.delayed(const Duration(seconds: 3));
    final String? userToken = await sharedPreferencesHelper.getToken();
    final bool isUserAlreadySigned = userToken != null&&userToken != '';

    if (isUserAlreadySigned) return emitAuthorizedState();

    emitUnauthorizedState();
  }

  void emitFirstAccessState() {
    authCubit.updateFirstAccessState();
  }

  void emitForceUpdating() {
    authCubit.emitForceUpdating();
  }

  void emitUnauthorizedState() {
    authCubit.emitUnauthorizedState();
  }

  void emitAuthorizedState() {
    authCubit.emitAuthorizedState();
  }

  void emitNoInternetConnectionState() {
    authCubit.emitNoInternetConnectionState();
  }
}
