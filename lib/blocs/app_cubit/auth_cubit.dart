import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:roommate/blocs/app_cubit/auth_state.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/main.dart';

/// Handle Application Auth States. Used to set app root widget
///
/// *Available states*:
/// - [AuthorizedState] -> Registered and authenticated user, should show home
/// - [UnauthorizedState] -> User without authentication, should show login
/// - [FirstTimeAccessState] -> First time user, should show intro if any.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(SplashState());

  /// Update isFirstAccess State
  ///
  /// this updates the first access state so when the app is relaunched it doesn't show the onBoarding
  void updateFirstAccessState() {
    emit(FirstTimeAccessState());
  }

  /// emitAuthorizedState
  Future<void> emitAuthorizedState() async {
    emit(AuthorizedState());
  }

  void emitUnauthorizedState() {
    emit(UnauthorizedState());
  }

  void emitRootedState() {
    emit(RootedState());
  }

  void emitBlockedLocationState() {
    emit(LocationState());
  }

  void emitVbnActiveState() {
    emit(VbnActiveState());
  }

  void emitJailbrokenState() {
    emit(JailBrokenState());
  }

  void emitNoInternetConnectionState() {
    emit(NoInternetConnectionState());
  }

  void emitForceUpdating() {
    emit(ForceUpdateState());
  }

  void emitHasMissingData() {
    emit(HasMissingDataState());
  }

  Future<void> logout() async {
    // await authRepo.clearSecureStorageData();

    emit(UnauthorizedState());
  }

  handleRedirectScreen(AuthState state) async {
    /// Redirect user to login page if the user token expired and
    /// the current state is [UnauthorizedState]
    if (state is UnauthorizedState) {
      Navigation(navigatorKey: navigatorKey)
          .navigateAndRemoveUntil(routeName: RoutesNames.loginScreen);
    }

    /// Redirect user to home page in case user signed successfully and has token
    if (state is AuthorizedState) {
      return Navigation(navigatorKey: navigatorKey)
          .navigateAndRemoveUntil(routeName: RoutesNames.homeScreen);
    }
    return null;
  }
}
