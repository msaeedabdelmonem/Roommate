import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/models/search_location/city_model.dart';
import 'package:roommate/repositories/home/home_repo.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';

class HomeCubit extends Cubit<RequestState> {
  HomeCubit({required this.homeRepo}) : super(RequestInit());
  final HomeRepo homeRepo;
  List<RoomModel> rooms = [];
  List<RoomModel> searchedRooms = [];
  final searchCubit = navigatorKey.currentState!.context.read<SearchCubit>();
  final locationCubit =
      navigatorKey.currentState!.context.read<LocationCubit>();
  final districtCubit =
      navigatorKey.currentState!.context.read<DistrictCubit>();

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

    List<RoomModel> rooms = [];
    List<RoomModel> deletedRooms = [];
    if (searchCubit.priceWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      filterBYPrice(deletedRooms: deletedRooms,rooms: rooms);
    }
    if (searchCubit.typeWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      filterByType(deletedRooms: deletedRooms,rooms: rooms);
    }
    if (districtCubit.districtWidgets
            .indexWhere((element) => element.isActivated == true) >
        -1) {
      filterByLocation(deletedRooms: deletedRooms,rooms: rooms);
    }
    deletedRooms.forEach((element) {
      rooms.remove(element);
    });
    deletedRooms.clear();
    emitRooms(response: rooms, forSearch: true);
  }

  void filterBYPrice({required List<RoomModel> deletedRooms,required List<RoomModel> rooms}) {
    int index = searchCubit.priceWidgets
        .indexWhere((element) => element.isActivated == true);
    final model = searchCubit.priceWidgets.elementAt(index).sheetItemModel;
    getCorrespondingRoomsList(rooms: rooms).forEach((element) {
      // RoomModel? roomModel = validateRoom(rooms, element);
      if (validatePrice(roomModel: element, selectedModel: model)) {
        insertInRooms(model: element, rooms: rooms);
      } else {
        deletedRooms.add(element);
      }
    });
  }

  void filterByType({required List<RoomModel> deletedRooms,required List<RoomModel> rooms}) {
    int index = searchCubit.typeWidgets
        .indexWhere((element) => element.isActivated == true);
    final model = searchCubit.typeWidgets.elementAt(index).sheetItemModel;
    getCorrespondingRoomsList(rooms: rooms).forEach((element) {
      // RoomModel? roomModel = validateRoom(rooms, element);
      if (validateRoomType(roomModel: element, selectedModel: model)) {
        insertInRooms(model: element, rooms: rooms);
      } else {
        deletedRooms.add(element);
      }
    });
  }

  void filterByLocation({required List<RoomModel> deletedRooms,required List<RoomModel> rooms}) {
    int cityIndex = locationCubit.state
        .indexWhere((element) => element.isActivated == true);
    int districtIndex = districtCubit.state
        .indexWhere((element) => element.isActivated == true);
    final cityModel = locationCubit.state.elementAt(cityIndex).cityModel;
    if (districtIndex > -1) {
      final districtModel =
          districtCubit.state.elementAt(districtIndex).sheetItemModel;
      getCorrespondingRoomsList(rooms: rooms).forEach((element) {
        // RoomModel? roomModel = validateRoom(rooms, element);
        if (validateRoomDistrict(
          selectedModel: districtModel,
          roomModel: element,
          selectedCityModel: cityModel,
        )) {
          insertInRooms(model: element, rooms: rooms);
        } else {
          deletedRooms.add(element);
        }
      });
    } else {
      removeLocationFilter(cityIndex);
    }
  }

  void removeLocationFilter(int cityIndex) {
    final locationCubit =
        navigatorKey.currentState!.context.read<LocationCubit>();
    locationCubit.citiesWidgets[cityIndex].isActivated = false;
    final context = navigatorKey.currentContext!;
    context.read<HomeCubit>().clearSearchResult();
   if(!searchCubit.checkFilters()){
     getRooms();
   }
    context.read<DistrictCubit>().districtWidgets.forEach((element) {
      element.isActivated = false;
    });
  }

  List<RoomModel> getCorrespondingRoomsList({required List<RoomModel> rooms}) {
    if (rooms.isNotEmpty) {
      return rooms;
    }
    return navigatorKey.currentState!.context.read<HomeCubit>().rooms;
  }

  insertInRooms({required List<RoomModel> rooms, required RoomModel model}) {
    if (!rooms.contains(model)) {
      rooms.add(model);
    }
  }

  bool validatePrice(
      {required RoomModel? roomModel, required SheetItemModel selectedModel}) {
    if (roomModel != null) {
      return double.parse((roomModel.price.toString())) >= selectedModel.min &&
          double.parse((roomModel.price.toString())) <= selectedModel.max;
    }
    return false;
  }

  bool validateRoomType(
      {required RoomModel? roomModel, required SheetItemModel selectedModel}) {
    if (roomModel != null) {
      return roomModel.type == selectedModel.type;
    }
    return false;
  }

  bool validateRoomDistrict(
      {required RoomModel? roomModel,
      required CityModel selectedCityModel,
      required SheetItemModel selectedModel}) {
    if (roomModel != null) {
      return roomModel.district?.toLowerCase().trim() ==
              selectedCityModel.city?.toLowerCase().trim() ||
          roomModel.district?.toLowerCase().trim() ==
              selectedModel.name?.toLowerCase().trim() ||
          roomModel.districtAr?.toLowerCase().trim() ==
              selectedCityModel.cityAr?.toLowerCase().trim() ||
          roomModel.districtAr?.toLowerCase().trim() ==
              selectedModel.nameAr?.toLowerCase().trim();
    }
    return false;
  }

  RoomModel? validateRoom(List<RoomModel> rooms, RoomModel roomModel) {
    int index = rooms.indexWhere((element) => element.id == roomModel.id);
    if (index > -1) {
      return rooms[index];
    } else if (rooms.isEmpty) {
      return roomModel;
    }
    return null;
  }
}
