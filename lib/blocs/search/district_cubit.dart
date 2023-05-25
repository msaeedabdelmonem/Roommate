import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/models/search_location/city_model.dart';
import 'package:roommate/ui/screens/search/widgets/city_widget.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';

class DistrictCubit extends Cubit<List<RadioBtn>> {
  DistrictCubit() : super([]);
  List<RadioBtn> districtWidgets = [];

  emitActivatedDistrictState(int index) {
    RadioBtn radioBtn = RadioBtn(
      isActivated: true,
      sheetItemModel: state[index].sheetItemModel,
    );
    state[index] = radioBtn;
    for (int counter = 0; counter < districtWidgets.length; counter++) {
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

  void emitDistrictsInitialList() {
    emit(districtWidgets);
  }

  generateDistricts(CityModel cityModel) {
    districtWidgets = List.generate(
        cityModel.districts!.length,
        (index) => RadioBtn(
              isActivated: false,
              sheetItemModel: cityModel.districts![index],
            ));
    emit(districtWidgets);
  }
}
