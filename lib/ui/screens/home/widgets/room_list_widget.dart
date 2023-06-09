import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/search_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/loading.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/screens/home/widgets/room_widget.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';
import 'package:roommate/ui/widgets/no_data_widget.dart';

class RoomListWidget<T extends Cubit<RequestState>> extends StatelessWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          _onRefresh(context: context);
          return Future<bool>.value(false);
        },
        child: SizedBox(
            height: 1.sh,
            child:
                BlocBuilder<T, RequestState>(builder: (context, state) {
              if (state is RequestLoaded) {
                Loading.dismissLoading();
                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  itemBuilder: (BuildContext context, int index) {
                    return RoomWidget(roomModel: state.date[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return space(24);
                  },
                  itemCount: state.date.length,
                );
              } else if (state is RequestError) {
                Loading.dismissLoading();
                return NoDataWidget();
              }
             else {
               if(T is HomeCubit) {
                 Loading.showLoading();
               }
                return SizedBox();
              }
            })));
  }
  void _onRefresh({required BuildContext context}){
    if(!(T is HomeCubit)) {
      context.read<HomeCubit>().clearSearchResult();
      context.read<HomeCubit>().getRooms();
      context.read<SearchCubit>().generateFilterWidgets();
      context
          .read<DistrictCubit>()
          .districtWidgets
          .forEach((element) {
        element.isActivated = false;
      });
    }
  }
}
