import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/screens/home/widgets/header_widget.dart';
import 'package:roommate/ui/screens/home/widgets/room_list_widget.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';
import 'package:roommate/ui/widgets/filters.dart';
import 'package:roommate/ui/widgets/searh_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  searchCubit = context.read<SearchCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeaderWidget(),
          space(10),
          Visibility(
            visible:renderVisibilty(context: context) ,
            child: CustomText(
              text: context.localization.lookingFor,
              style: TextStyle(
                  color: ConstantsColors.blackColor,
                  fontSize: AppFontSize.mid_small,
                 ),
            ),
          ),
          Visibility(
            visible:renderNumberVisibilty(context: context) ,
            child: CustomText(
              text: context.localization.searchResults(context.watch<HomeCubit>().searchedRooms.length.toString()),
              style: TextStyle(
                  color: ConstantsColors.blackColor,
                  fontSize: AppFontSize.mid_small,
                  fontWeight: FontWeight.w400
              ),
            ),
          ),
          Filters(),
          // SearchWidget(enabled: false),
          Expanded(
            child: RoomListWidget<HomeCubit>(),
          )
        ],
      ),
    );
  }

  bool renderVisibilty({required BuildContext context}){
    if(context.read<SearchCubit>().checkFilters()){
   return false;
    }else{
      if(context.read<HomeCubit>().searchedRooms.isEmpty){
        return true;
      }else {
        return false;
      }
    }
  }
  bool renderNumberVisibilty({required BuildContext context}){
    if(context.read<SearchCubit>().checkFilters()){
   return true;
    }else{
      if(context.read<HomeCubit>().searchedRooms.isEmpty){
        return false;
      }else {
        return true;
      }
    }
  }
}
