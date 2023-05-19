import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';


ButtonThemeData buttonTheme = ButtonThemeData(
  height: 90.h,
  buttonColor:ConstantsColors.redColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.r),
  ),
  textTheme: ButtonTextTheme.primary,
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor:ConstantsColors.mainBackgroundColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
   
  ),
);

FloatingActionButtonThemeData floatingActionButtonThemeData =
    const FloatingActionButtonThemeData(
  backgroundColor:ConstantsColors.mainBackgroundColor,
  splashColor: Colors.grey,
);
