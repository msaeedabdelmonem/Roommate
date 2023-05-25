import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';

class ImageHeaderWidget extends StatelessWidget {
  const ImageHeaderWidget({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigation(navigatorKey: navigatorKey).goBack(),
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ConstantsColors.whiteColor,
              ),
              child: const Icon(Icons.close,
                  size: 22, color: ConstantsColors.blackColor),
            ),
          ),
          InkWell(
            onTap: ()=>  Helper().share(roomModel),
            child: SvgPicture.asset(ImagePaths.share,color: ConstantsColors.whiteColor,)
          )
        ],
      ),
    );
  }
}
