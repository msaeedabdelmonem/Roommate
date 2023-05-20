import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Contact the owner',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ConstantsColors.blackColor,
                      fontSize: AppFontSize.x_medium,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              space(3),
              CustomText(
                text: 'Subtitle here',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ConstantsColors.greyColor,
                      fontSize: AppFontSize.mid_small,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          InkWell(
            onTap: (){
              Navigation(navigatorKey: navigatorKey).navigateTo(routeName: RoutesNames.ratingScreen);
            },
            child: Row(
              children: [
                SvgPicture.asset(ImagePaths.phone),
                space(0, 12),
                SvgPicture.asset(ImagePaths.messenger),
                space(0, 12),
                SvgPicture.asset(ImagePaths.whatsapp),
              ],
            ),
          )
        ],
      ),
    );
  }
}
