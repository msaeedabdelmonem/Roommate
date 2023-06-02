

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/repositories/home/home_repo.dart';

class HomeCubit extends Cubit<RequestState> {
  HomeCubit({required this.homeRepo}) : super(RequestInit());
  final HomeRepo homeRepo;
  List<RoomModel> rooms = [];
  List<RoomModel> searchedRooms = [];

  Future getRooms() async {
    emit(RequestLoading());
    // navigatorKey.currentState!.context.read<SearchCubit>().resetFilters();
    final response = await homeRepo.getRooms();
    emitRooms(response: response);
  }

  emitRooms({required List<RoomModel> response, bool forSearch = false}) {
    if (response.isNotEmpty) {
      _generateEmittedRooms(response: response, forSearch: forSearch);
    } else {
      emit(RequestError());
    }
  }

  void _generateEmittedRooms(
      {required bool forSearch, required List<RoomModel> response}) {
    if (forSearch) {
      searchedRooms = response;
    } else {
      rooms = response;
    }
    emit(RequestLoaded(date: response));
  }

  void clearSearchResult() {
    searchedRooms.clear();
  }

  getFilteredItem() async {
    emit(RequestLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    final searchCubit = navigatorKey.currentState!.context.read<SearchCubit>();
    final locationCubit =
        navigatorKey.currentState!.context.read<LocationCubit>();
    final districtCubit =
        navigatorKey.currentState!.context.read<DistrictCubit>();
    final List<RoomModel> rooms = [];
    if (searchCubit.priceWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      int index = searchCubit.priceWidgets
          .indexWhere((element) => element.isActivated == true);
      final model = searchCubit.priceWidgets.elementAt(index).sheetItemModel;
      navigatorKey.currentState!.context
          .read<HomeCubit>()
          .rooms
          .forEach((element) {
        if (double.parse((element.price.toString())) >= model.min &&
            double.parse((element.price.toString())) <= model.max) {
          rooms.add(element);
        }
      });
    } else if (searchCubit.typeWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      int index = searchCubit.typeWidgets
          .indexWhere((element) => element.isActivated == true);
      final model = searchCubit.typeWidgets.elementAt(index).sheetItemModel;
      navigatorKey.currentState!.context
          .read<HomeCubit>()
          .rooms
          .forEach((element) {
        if (element.type == model.type) {
          rooms.add(element);
        }
      });
    } else if (districtCubit.districtWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      int cityIndex = locationCubit.state
          .indexWhere((element) => element.isActivated == true);
      int districtIndex = districtCubit.state
          .indexWhere((element) => element.isActivated == true);
      final cityModel = locationCubit.state.elementAt(cityIndex).cityModel;
      if(districtIndex>-1) {
        final districtModel =
            districtCubit.state
                .elementAt(districtIndex)
                .sheetItemModel;
        navigatorKey.currentState!
            .context
            .read<HomeCubit>()
            .rooms
            .forEach((element) {
          bool ckeckDistrict = element.district?.toLowerCase().trim() ==
              cityModel.city?.toLowerCase().trim() ||
              element.district?.toLowerCase().trim() ==
                  districtModel.name?.toLowerCase().trim() ||
              element.districtAr?.toLowerCase().trim() ==
                  cityModel.cityAr?.toLowerCase().trim() ||
              element.districtAr?.toLowerCase().trim() ==
                  districtModel.nameAr?.toLowerCase().trim();
          if (ckeckDistrict) {
            rooms.add(element);
          }
        });
      }else{
        locationCubit.citiesWidgets[cityIndex].isActivated = false;
        getRooms();
      }
    }

    emitRooms(response: rooms, forSearch: true);
  }
}
