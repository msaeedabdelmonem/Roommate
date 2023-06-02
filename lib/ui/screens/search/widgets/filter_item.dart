import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    required this.name,
    required this.imagePath,
    this.isActive = false,
  }) : super(key: key);
  final String name;
  final String imagePath;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        height: 35.h,
        decoration: BoxDecoration(
          color: ConstantsColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
          border: Border.all(
              color: isActive
                  ? ConstantsColors.blackColor
                  : ConstantsColors.lightGreyColor),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            imagePath,
            height: 18.h,
            width: 18.w,
          ),
          space(0, 8),
          CustomText(
              text: name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ConstantsColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.smallMedium),
              alignment: AlignmentDirectional.center),
        ]));
  }
}
