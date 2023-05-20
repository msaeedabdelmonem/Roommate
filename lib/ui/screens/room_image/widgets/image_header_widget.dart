import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';

class ImageHeaderWidget extends StatelessWidget {
  const ImageHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Icon(
          Icons.share,
          color: ConstantsColors.whiteColor,
          size: 25,
        )
      ],
    );
  }
}
