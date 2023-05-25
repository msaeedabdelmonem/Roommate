import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/ui/screens/search/widgets/filter_item.dart';
import 'package:roommate/ui/screens/search/widgets/filter_widget.dart';
import 'package:roommate/ui/widgets/searh_widget.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({Key? key}) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final searchCubit = context.read<SearchCubit>();
    // searchCubit.generateFilters();
    return
      BlocBuilder<SearchDataCubit, RequestState>(builder: (context, state) {
        return
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchWidget(enabledBorder: false,isSearchApplied: true,formKey: _formKey),
          // Container(
          //   height: 70.h,
          //   width: 1.sw,
          //   padding: EdgeInsets.all(5.h),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: ConstantsColors.lightGreyColor),
          //     borderRadius: BorderRadius.only(
          //         bottomRight: Radius.circular(16.r),
          //         bottomLeft: Radius.circular(16.r)),
          //   ),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: List.generate(3, (index) {
          //         FilterType filterType = FilterType.Price;
          //         if (index == 1) {
          //           filterType = FilterType.Location;
          //         } else if (index == 2) {
          //           filterType = FilterType.Type;
          //         }
          //         return InkWell(
          //             onTap: () => _onFilterClick(
          //                 context: context, filterType: filterType),
          //             child: SheetRenderedItem(
          //               filterIndex: index,
          //             ));
          //       })),
          // )
        ],
      ),
    );});
  }

  // void _onFilterClick(
  //     {required FilterType filterType, required BuildContext context}) {
  //   if (filterType == FilterType.Location) {
  //     Helper().showBottomSheet(
  //         widget: FilterWidget(filterType: filterType), isLocation: true);
  //   } else if (filterType == FilterType.Price) {
  //     context.read<SearchCubit>().emitPricesInitialList();
  //     Helper().showBottomSheet(widget: FilterWidget(filterType: filterType));
  //   } else {
  //     context.read<SearchCubit>().emitTypesInitialList();
  //     Helper().showBottomSheet(widget: FilterWidget(filterType: filterType));
  //   }
  // }
}


