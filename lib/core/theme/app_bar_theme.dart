import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';



final appBarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
  iconTheme: const  IconThemeData(
    color:  ConstantsColors.mainBackgroundColor,
    size: 20,
  ),
  titleTextStyle: TextStyle(
    fontSize: 20.sp,
    color: ConstantsColors.textBlackColor,
    fontWeight: FontWeight.bold,
  ),
);
