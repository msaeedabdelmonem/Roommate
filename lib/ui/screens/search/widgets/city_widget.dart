import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/search/city_cubit.dart';
import 'package:roommate/blocs/search/district_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/models/search_location/city_model.dart';
import 'package:roommate/ui/screens/search/widgets/radio_btn.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class CityWidget extends StatelessWidget {
  CityWidget({Key? key, required this.cityModel, required this.isActivated})
      : super(key: key);
  final CityModel cityModel;
  bool isActivated;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          BlocBuilder<CityCubit, bool>(builder: (context, state) {
            return Icon(
              isActivated
                  ? Icons.keyboard_arrow_down_outlined
                  : Icons.keyboard_arrow_right_outlined,
              color: ConstantsColors.blackColor,
              size: 25.w,
            );
          }),
          space(0, 12),
          CustomText(
            text: cityModel.city ?? '',
            alignment: AlignmentDirectional.center,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ConstantsColors.blackColor,
              fontSize: AppFontSize.medium,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      Visibility(visible: isActivated, child: space(18)),
      BlocBuilder<DistrictCubit, List<RadioBtn>>(builder: (ctx, state) {
        return AnimatedContainer(
          height: isActivated
              ? state.length > 5
                  ? 300.h
                  : 100.h
              : 20.h,
          width: 1.sw,
          duration: Duration(milliseconds: 500),
          child: Visibility(
            visible: isActivated,
            child: ListView.separated(
              controller: Helper().bottomSheetScrollable,
              itemCount: state.length,
              itemBuilder: (_, index) {
                return InkWell(
                    onTap: () {
                      context
                          .read<DistrictCubit>()
                          .emitActivatedDistrictState(index);
                    },
                    child: state[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return space(25.h);
              },
            ),
          ),
        );
      })
    ]);
  }
}
