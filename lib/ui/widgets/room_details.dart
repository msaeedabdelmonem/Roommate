import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RoomDetailsWidget extends StatelessWidget {
  const RoomDetailsWidget(
      {Key? key,
      required this.roomModel,
      this.roomTypeColor,
      this.roomPriceColor,
      this.roomTitleColor,
      this.backgroundColor = ConstantsColors.transparent,
      this.height,
      this.radius = 0,
      this.spaceHeight = 6,
      this.padding})
      : super(key: key);
  final RoomModel roomModel;
  final Color? roomTypeColor;
  final Color? roomPriceColor;
  final Color? roomTitleColor;
  final Color backgroundColor;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final double spaceHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: 2,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: _renderType(type: roomModel.type, context: context),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        fontWeight: FontWeight.w700,
                        color: roomTypeColor ?? ConstantsColors.blackColor,
                      ),
                ),
                TextSpan(
                  text: context.localization.inWord,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        color: roomTypeColor ?? ConstantsColors.greyColor,
                      ),
                ),
                TextSpan(
                  text: _renderDistrict(context: context),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        fontWeight: FontWeight.w700,
                        color: roomTypeColor ?? ConstantsColors.blue,
                      ),
                )
              ],
            ),
          ),
          space(spaceHeight),
          CustomText(
            text: _renderTitle(context: context)??'',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: roomTitleColor ?? ConstantsColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: AppFontSize.x_large,
                ),
          ),
          space(spaceHeight),
          RichText(
            maxLines: 1,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${roomModel.price} EGP ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.x_medium,
                        fontWeight: FontWeight.w600,
                        color: roomPriceColor ?? ConstantsColors.blackColor,
                      ),
                ),
                TextSpan(
                  text: context.localization.perMonth,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        fontWeight: FontWeight.w400,
                        color: ConstantsColors.greyColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _renderType({required int type, required BuildContext context}) {
    if (type == 0) {
      return context.localization.entireRoom;
    } else if (type == 1) {
      return context.localization.single;
    } else if (type == 2) {
      return context.localization.double;
    } else {
      return context.localization.tribble;
    }
  }
  String? _renderDistrict({required BuildContext context}){
    if(context.read<LocalizationCubit>().state.languageCode=='en'){
      return roomModel.district;
    }else{
      return roomModel.districtAr;
    }
  }
  String? _renderTitle({required BuildContext context}){
    if(context.read<LocalizationCubit>().state.languageCode=='en'){
      return roomModel.title;
    }else{
      return roomModel.titleAr;
    }
  }
}
