import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/repositories/home/home_repo.dart';

class SearchFieldCubit extends Cubit<RequestState> {
  SearchFieldCubit() : super(RequestInit());

  List<RoomModel> searchedRooms = [];



  emitRooms({required List<RoomModel> response, bool forSearch = false}) {
    if (response.isNotEmpty) {
      _generateEmittedRooms(response: response, forSearch: forSearch);
    } else {
      emit(RequestError());
    }
  }

  void _generateEmittedRooms(
      {required bool forSearch, required List<RoomModel> response}) {

      searchedRooms = response;

    emit(RequestLoaded(date: response));
  }
  void clearSearchResult(){
    searchedRooms.clear();
  }

}
