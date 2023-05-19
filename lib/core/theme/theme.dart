import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/theme/app_bar_theme.dart';
import 'package:roommate/core/theme/bottom_sheet_theme.dart';
import 'package:roommate/core/theme/button_theme.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/theme/icon_theme.dart';
import 'package:roommate/core/theme/input_decoration_theme.dart';
import 'package:roommate/core/theme/text_theme.dart';

class Themes {
  buildThemeData({required bool isArabic}) => ThemeData(
        primaryColor: ConstantsColors.whiteColor,
        scaffoldBackgroundColor: ConstantsColors.whiteColor,
        disabledColor: Colors.grey.shade400,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ConstantsColors.lightGreyColor,
          primary: ConstantsColors.mainBackgroundColor,
        ),
        appBarTheme: appBarTheme,
        textTheme: textTheme.apply(fontSizeFactor: 1.sp),
        inputDecorationTheme: inputDecorationTheme,
        iconTheme: iconTheme,
        buttonTheme: buttonTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
        bottomSheetTheme: bottomSheetTheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );
}
