import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/app_cubit/auth_state.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/core/utils/loading.dart';
import 'package:roommate/repositories/auth_repo.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit(
      {required this.authRepo,
      required this.authCubit,
      required this.sharedPreferencesHelper})
      : super(UnauthorizedState());
  final AuthRepo authRepo;
  final AuthCubit authCubit;
  final SharedPreferencesHelper sharedPreferencesHelper;

  Future<void> signInWithGoogle() async {
    Loading.showLoading();
    await authRepo.signInWithGoogle(onSuccess: (token) async {
      await sharedPreferencesHelper.saveToken(token);

      authCubit.emitAuthorizedState();
      Loading.dismissLoading();
    }, onFail: () {
      Loading.dismissLoading();
    });
  }
}
