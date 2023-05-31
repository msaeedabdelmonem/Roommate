import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/repositories/auth_repo.dart';

class ProfileCubit extends Cubit<void> {
  ProfileCubit({required this.authCubit, required this.authRepo}) : super(null);
  final AuthRepo authRepo;
  final AuthCubit authCubit;
  void logOut() {
    authRepo.clearStorageData();
    authCubit.emitUnauthorizedState();
  }

  Future<String?> getLanguageCode() async {
    return  authRepo.getLanguageCode();
  }
}
