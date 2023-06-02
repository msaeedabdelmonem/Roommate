import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({Key? key, required this.title, required this.subTitle}) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
              color: ConstantsColors.whiteColor,
              fontSize: AppFontSize.x_x_x_large,
              fontWeight: FontWeight.bold),
        ),
        space(5),
        CustomText(
          text: subTitle,
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: TextStyle(
              color: ConstantsColors.greyColor, fontSize: AppFontSize.medium),
        ),
      ],
    );
  }
}
