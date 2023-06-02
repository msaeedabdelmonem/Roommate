import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/models/search_location/city_model.dart';
import 'package:roommate/ui/screens/search/widgets/city_widget.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';

class LocationCubit extends Cubit<List<CityWidget>> {
  LocationCubit() : super([]);
  List<CityWidget> citiesWidgets = [];

  emitActivatedCityState(
    int index,
  ) {
    CityWidget cityWidget = CityWidget(
      isActivated: !state[index].isActivated,
      cityModel: state[index].cityModel,
    );
    state[index] = cityWidget;
    for (int counter = 0; counter < citiesWidgets.length; counter++) {
      if (counter == index) {
        continue;
      }
      CityWidget city = CityWidget(
        isActivated: false,
        cityModel: state[counter].cityModel,
      );
      state[counter] = city;
    }
    citiesWidgets = state;
    emit([...state]);
  }

  emitCitiesInitialList() {
    emit(citiesWidgets);
  }

  generateCities() {
    citiesWidgets = List.generate(
        navigatorKey.currentState!.context
            .read<SearchDataCubit>()
            .cities
            .length,
        (index) => CityWidget(
              isActivated: false,
              cityModel: navigatorKey.currentState!.context
                  .read<SearchDataCubit>()
                  .cities[index],
            ));
    emit(citiesWidgets);
  }
}
