import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/models/room/type_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RadioBtn extends StatelessWidget {
  RadioBtn({Key? key, required this.sheetItemModel, required this.isActivated})
      : super(key: key);
  SheetItemModel sheetItemModel;
  bool isActivated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25.h,
          width: 25.w,
          decoration: BoxDecoration(
              color: isActivated
                  ? ConstantsColors.blackColor
                  : ConstantsColors.whiteColor,
              border: Border.all(color: ConstantsColors.greyColor),
              shape: BoxShape.circle),
          child: isActivated
              ? Icon(
                  Icons.done,
                  color: ConstantsColors.whiteColor,
                  size: 17.w,
                )
              : SizedBox(),
        ),
        space(0, 12),
        CustomText(
          text: sheetItemModel.name ?? '',
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ConstantsColors.blackColor,
            fontSize: AppFontSize.smallMedium,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
