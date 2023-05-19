import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit(super.initialState);

  emitNextPage(int page) {
    emit(page);
  }
}
