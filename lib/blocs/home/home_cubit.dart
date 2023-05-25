import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/repositories/home/home_repo.dart';

class HomeCubit extends Cubit<RequestState> {
  HomeCubit({required this.homeRepo}) : super(RequestInit());
  final HomeRepo homeRepo;
  List<RoomModel> rooms = [];
  Future getRooms() async {
    emit(RequestLoading());
    final response = await homeRepo.getRooms();
    emitRooms(response: response);
  }

  emitRooms({required List<RoomModel> response}){
    if (response.isNotEmpty) {
      rooms = response;
      emit(RequestLoaded(date: response));
    } else {
      emit(RequestError());
    }
  }

  getFilteredItem() async {
    emit(RequestLoading());
    await Future.delayed(const Duration(milliseconds: 300));
    final searchCubit = navigatorKey.currentState!.context.read<SearchCubit>();
    final locationCubit = navigatorKey.currentState!.context.read<LocationCubit>();
    final List<RoomModel>rooms = [];
    if(searchCubit.availableFilters.isNotEmpty) {
      if (searchCubit.availableFilters.contains(FilterType.Price)) {
        int index = searchCubit.priceWidgets.indexWhere((element) =>
        element.isActivated == true);
        final model = searchCubit.priceWidgets
            .elementAt(index)
            .sheetItemModel;
        navigatorKey.currentState!
            .context
            .read<HomeCubit>()
            .rooms
            .forEach((element) {
          if (double.parse((element.price.toString())) >= model.min && double.parse((element.price.toString())) <= model.max) {
            rooms.add(element);
          }
        });
      } else if (searchCubit.availableFilters.contains(FilterType.Type)) {
        int index = searchCubit.typeWidgets.indexWhere((element) =>
        element.isActivated == true);
        final model = searchCubit.typeWidgets
            .elementAt(index)
            .sheetItemModel;
        navigatorKey.currentState!
            .context
            .read<HomeCubit>()
            .rooms
            .forEach((element) {
          if (element.type == model.type) {
            rooms.add(element);
          }
        });
      } else {
        int index = locationCubit.citiesWidgets.indexWhere((element) =>
        element.isActivated == true);
        final model = locationCubit.citiesWidgets
            .elementAt(index)
            .cityModel;
        navigatorKey.currentState!
            .context
            .read<HomeCubit>()
            .rooms
            .forEach((element) {
          if (element.city == model.city) {
            rooms.add(element);
          }
        });
      }
    }
    emitRooms(response: rooms);
  }
}
