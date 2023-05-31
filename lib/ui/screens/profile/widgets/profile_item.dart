import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key,
      required this.trailingWidget,
      required this.title,
      required this.subTitle,
      required this.onClick, required this.iconPath})
      : super(key: key);
  final Widget trailingWidget;
  final String title;
  final String subTitle;
  final Function onClick;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              SvgPicture.asset(iconPath),
              space(0, 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ConstantsColors.blackColor,
                        fontSize: AppFontSize.x_medium),
                  ),
                  space(5),
                  CustomText(
                    text: subTitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: ConstantsColors.greyColor,
                        fontSize: AppFontSize.smallMedium),
                  ),
                ],
              ),
            ],
          ),
        trailingWidget
        ]),
      ),
    );
  }
}
