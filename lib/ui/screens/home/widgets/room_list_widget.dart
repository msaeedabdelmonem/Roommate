import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/request_state.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/utils/loading.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/screens/home/widgets/room_widget.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RoomListWidget extends StatelessWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, RequestState>(builder: (context, state) {
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
      } else {
        Loading.showLoading();
        return SizedBox();
      }
    });
  }
}
