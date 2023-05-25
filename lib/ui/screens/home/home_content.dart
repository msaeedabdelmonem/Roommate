import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/screens/home/widgets/header_widget.dart';
import 'package:roommate/ui/screens/home/widgets/room_list_widget.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';
import 'package:roommate/ui/widgets/filters.dart';
import 'package:roommate/ui/widgets/searh_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HeaderWidget(),
          space(10),
          CustomText(
            text: context.localization.lookingFor,
            style: TextStyle(
                color: ConstantsColors.blackColor,
                fontSize: AppFontSize.mid_small,
               ),
          ),
          Filters(),
          // SearchWidget(enabled: false),
          Expanded(
            child: RoomListWidget(),
          )
        ],
      ),
    );
  }
}
