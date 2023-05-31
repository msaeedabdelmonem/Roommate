import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/ui/screens/search/widgets/filter_widget.dart';
import 'package:roommate/ui/widgets/sheet_rendered_item.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<SearchDataCubit, RequestState>(builder: (context, state) {
        return
      Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0.h),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (index) {
            FilterType filterType = FilterType.Type;
            if (index == 1) {
              filterType = FilterType.Location;
            } else if (index == 2) {
              filterType = FilterType.Price;
            }
            return InkWell(
                onTap: () =>
                    _onFilterClick(context: context, filterType: filterType),
                child: SheetRenderedItem(
                  filterIndex: index,
                ));
          })),
    );});
  }
  void _onFilterClick(
      {required FilterType filterType, required BuildContext context}) {
    if (filterType == FilterType.Location) {
      Helper().showBottomSheet(
          widget: FilterWidget(filterType: filterType), isLocation: true);
    } else if (filterType == FilterType.Price) {
      context.read<SearchCubit>().emitPricesInitialList();
      Helper().showBottomSheet(widget: FilterWidget(filterType: filterType));
    } else {
      context.read<SearchCubit>().emitTypesInitialList();
      Helper().showBottomSheet(widget: FilterWidget(filterType: filterType));
    }
  }
}
