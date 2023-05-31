import 'package:flutter/material.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/ui/screens/search/widgets/filter_item.dart';

class SheetRenderedItem extends StatelessWidget {
  const SheetRenderedItem({Key? key, required this.filterIndex})
      : super(key: key);
  final int filterIndex;

  @override
  Widget build(BuildContext context) {
    if (FilterType.Type.id == filterIndex) {
      return FilterItem(
        name: context.localization.type,
        imagePath: ImagePaths.type,
      );
    } else if (FilterType.Location.id == filterIndex) {
      return FilterItem(
        name: context.localization.location,
        imagePath: ImagePaths.location,
      );
    } else {
      return FilterItem(
        name: context.localization.price,
        imagePath: ImagePaths.price,
      );
    }
  }
}