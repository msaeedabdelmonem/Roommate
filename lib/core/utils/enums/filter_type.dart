import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/main.dart';

enum FilterType {
  Type(0),
  Location(1),
  Price(2);

  final int id;

  const FilterType(this.id);
}

extension FilterName on FilterType {
  String get name {
    switch (this) {
      case FilterType.Type:
        return navigatorKey.currentState!.context.localization.chooseType;
      case FilterType.Location:
        return navigatorKey.currentState!.context.localization.chooseLocation;
      case FilterType.Price:
        return navigatorKey.currentState!.context.localization.choosePrice;
    }
  }
}
