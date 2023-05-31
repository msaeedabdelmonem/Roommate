import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';

class SearchCubit extends Cubit<List<RadioBtn>> {
  SearchCubit() : super([]);



  List<RadioBtn> typeWidgets = [];
  List<RadioBtn> priceWidgets = [];
  List<FilterType> availableFilters =[];
  BuildContext context = navigatorKey.currentState!.context;
bool checkFilters(){
  bool isFilterTypeApplied = context.read<SearchCubit>().typeWidgets.indexWhere((element) => element.isActivated==true)>-1;
  bool isFilterPriceApplied = context.read<SearchCubit>().priceWidgets.indexWhere((element) => element.isActivated==true)>-1;
  bool isFilterLocationApplied = context.read<DistrictCubit>().districtWidgets.indexWhere((element) => element.isActivated==true)>-1;
  return  (isFilterTypeApplied||isFilterPriceApplied||isFilterLocationApplied);
}
bool generateFilters(){
  bool isFilterTypeApplied = typeWidgets.indexWhere((element) => element.isActivated==true)>-1;
  bool isFilterPriceApplied = priceWidgets.indexWhere((element) => element.isActivated==true)>-1;
  bool isFilterLocationApplied = context.read<DistrictCubit>().districtWidgets.indexWhere((element) => element.isActivated==true)>-1;
  if(isFilterPriceApplied){
    availableFilters.remove(FilterType.Price);
    availableFilters.add(FilterType.Price);
  }
  if(isFilterLocationApplied){
    availableFilters.remove(FilterType.Location);
    availableFilters.add(FilterType.Location);

  }
  if(isFilterTypeApplied){
    availableFilters.remove(FilterType.Type);
    availableFilters.add(FilterType.Type);
  }
  if(isFilterPriceApplied||isFilterLocationApplied||isFilterTypeApplied){
    return true;
  }
  return false;
}
void resetFilters(){
  typeWidgets.clear();
  priceWidgets.clear();
  context.read<DistrictCubit>().districtWidgets.clear();
}
  emitActivatedState(int index) {
    RadioBtn radioBtn = RadioBtn(
      isActivated: !state[index].isActivated,
      sheetItemModel: state[index].sheetItemModel,
    );
    state[index] = radioBtn;
    for (int counter = 0; counter < state.length; counter++) {
      if (counter == index) {
        continue;
      }
      RadioBtn btn = RadioBtn(
        isActivated: false,
        sheetItemModel: state[counter].sheetItemModel,
      );
      state[counter] = btn;
    }

    emit([...state]);
  }

  void emitPricesInitialList() {
    emit(priceWidgets);
  }

  void emitTypesInitialList() {
    emit(typeWidgets);
  }

  generateFilterWidgets() {
    _generateTypes();
    _generatePrices();
  }

  _generateTypes() {
    typeWidgets = List.generate(
        navigatorKey.currentState!.context.read<SearchDataCubit>().types.length,
        (index) => RadioBtn(
              sheetItemModel: navigatorKey.currentState!.context.read<SearchDataCubit>().types[index],
              isActivated: false,
            ));
    emit(typeWidgets);
  }

  _generatePrices() {
    priceWidgets = List.generate(
        navigatorKey.currentState!.context.read<SearchDataCubit>().prices.length,
        (index) => RadioBtn(
              sheetItemModel: navigatorKey.currentState!.context.read<SearchDataCubit>().prices[index],
              isActivated: false,
            ));
    emit(priceWidgets);
  }
}
