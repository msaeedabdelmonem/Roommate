import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/splash/splash_cubit.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/models/search_location/city_model.dart';
import 'package:roommate/repositories/home/search_repo.dart';

class SearchDataCubit extends Cubit<RequestState>{
  final SearchRepo searchRepo;

  SearchDataCubit({required this.searchRepo}) : super(RequestInit());
  List<SheetItemModel> prices = [];
  List<SheetItemModel> types = [];
  List<CityModel> cities = [
    // CityModel(city: 'cairo', districts: [
    //   SheetItemModel(id: '1', name: 'Nasr city'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    //
    // ]),
    // CityModel(city: 'ssss', districts: [
    //   SheetItemModel(id: '1', name: 'Nasr city'),
    //   SheetItemModel(id: '2', name: 'New Cairo'),
    // ])
  ];
  Future getPrices() async {
    emit(RequestLoading());
    List<SheetItemModel> response = await searchRepo.getPrices();
    if (response.isNotEmpty) {
        prices = response;
      emit(RequestLoaded(date: response));
    } else {
      emit(RequestError());
    }
  }

  Future getRoomTypes() async {
    emit(RequestLoading());
     List<SheetItemModel> response = await searchRepo.getRoomsTypes();
    if (response.isNotEmpty) {
      types = response;
      emit(RequestLoaded(date: response));
    } else {
      emit(RequestError());
    }
  }
  Future getLocations() async {
    emit(RequestLoading());
    List<CityModel> response = await searchRepo.getLocations();
    if (response.isNotEmpty) {
      cities = response;
      emit(RequestLoaded(date: response));
    } else {
      emit(RequestError());
    }
  }
  Future getAllData() async {
    await getPrices();
    await getLocations();
    await getRoomTypes();
    navigatorKey.currentState!.context.read<SearchCubit>().generateFilterWidgets();
    navigatorKey.currentState!.context.read<LocationCubit>().generateCities();
  }
}