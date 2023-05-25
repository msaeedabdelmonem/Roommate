import 'package:flutter_bloc/flutter_bloc.dart';

class CityCubit extends Cubit<bool> {
  CityCubit() : super(false);

  emitToggleState({required bool isActive}) {
    emit(isActive);
  }
}
