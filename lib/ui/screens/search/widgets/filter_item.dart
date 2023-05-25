import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 40.h,
      decoration: BoxDecoration(color: ConstantsColors.grayShadeColor,borderRadius: BorderRadius.all(
      Radius.circular(8.r),
      )),
      child: CustomText(
          text: name,
          textAlign: TextAlign.center,
       style: Theme.of(context).textTheme.bodySmall?.copyWith(
         color: ConstantsColors.blackColor,
         fontWeight: FontWeight.bold,
         fontSize: AppFontSize.smallMedium
       ),
          alignment: AlignmentDirectional.center),
    );
  }
}
