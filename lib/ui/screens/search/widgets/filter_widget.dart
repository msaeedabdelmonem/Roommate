import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/enums/filter_type.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/ui/screens/search/widgets/city_widget.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key, required this.filterType}) : super(key: key);
  final FilterType filterType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          space(32),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CustomText(
              text: filterType.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ConstantsColors.blackColor,
                    fontSize: AppFontSize.x_large,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            InkWell(
              onTap: () {
                _getFilteredDate(context);
              },
              child: Icon(
                Icons.close,
                color: ConstantsColors.blackColor,
                size: 23,
              ),
            )
          ]),
          space(31),
          Visibility(
            visible: filterType != FilterType.Location,
            child:
                BlocBuilder<SearchCubit, List<RadioBtn>>(builder: (ctx, state) {
              return Flexible(
                child: ListView.separated(
                  controller: Helper().bottomSheetScrollable,
                  itemCount: state.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                        onTap: () => _onItemClick(context, index),
                        child: state[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return space(25.h);
                  },
                ),
              );
            }),
          ),
          Visibility(
            visible: filterType == FilterType.Location,
            child: BlocBuilder<LocationCubit, List<CityWidget>>(
                builder: (ctx, state) {
              print(state.length);
              return Flexible(
                child: ListView.separated(
                  controller: Helper().bottomSheetScrollable,
                  itemCount: state.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                        onTap: () => _onItemClick(context, index),
                        child: state[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return space(10.h);
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _getFilteredDate(BuildContext context) {
    Navigation(navigatorKey: navigatorKey).goBack();
    final searchCubit = context.read<SearchCubit>();
    if(searchCubit.checkFilters()) {
      navigatorKey.currentState!.context.read<HomeCubit>().getFilteredItem();
    }
  }

  void _onItemClick(BuildContext context, int index) {
    if (filterType == FilterType.Type) {
      context.read<SearchCubit>().typeWidgets=  context.read<SearchCubit>().emitActivatedState(index);
    } else if (filterType == FilterType.Location) {
      context.read<DistrictCubit>().generateDistricts(navigatorKey
          .currentState!.context
          .read<SearchDataCubit>()
          .cities[index]);
      context.read<LocationCubit>().emitActivatedCityState(index);
    } else {
      context.read<SearchCubit>().priceWidgets =   context.read<SearchCubit>().emitActivatedState(index);
    }
  }
}
