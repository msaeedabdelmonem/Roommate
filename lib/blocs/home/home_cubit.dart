import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/repositories/home/home_repo.dart';

class HomeCubit extends Cubit<RequestState> {
  HomeCubit({required this.homeRepo}) : super(RequestInit());
  final HomeRepo homeRepo;

  Future getRooms() async {
    emit(RequestLoading());
    final response = await homeRepo.getRooms();
    if (response.isNotEmpty) {
      emit(RequestLoaded(date: response));
    } else {
      emit(RequestError());
    }
  }
}
