import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/ui/screens/search/widgets/filter_item.dart';

class SheetRenderedItem extends StatelessWidget {
  const SheetRenderedItem({Key? key, required this.filterIndex})
      : super(key: key);
  final int filterIndex;

  @override
  Widget build(BuildContext context) {
    final searchDataCubit = context.read<SearchDataCubit>();
    if (FilterType.Type.id == filterIndex) {
      return FilterItem(
        name: context.localization.type,
        imagePath: ImagePaths.type,
        isActive: searchDataCubit.activeList[FilterType.Type.id],
      );
    } else if (FilterType.Location.id == filterIndex) {
      return FilterItem(
        name: context.localization.location,
        imagePath: ImagePaths.location,
        isActive: searchDataCubit.activeList[FilterType.Location.id],
      );
    } else {
      return FilterItem(
        name: context.localization.price,
        imagePath: ImagePaths.price,
        isActive: searchDataCubit.activeList[FilterType.Price.id],
      );
    }
  }
}
