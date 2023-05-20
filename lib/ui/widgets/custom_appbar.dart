import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import '../../../main.dart';

// ignore: must_be_immutable
class CustomAppBar extends AppBar {
  List<Widget> trailingWidgets;
  bool showBackBtn;
  String appbarTitle;
  Widget? titleWidget;
  Function? onPobClick;
  Color backIconColor;
  Color backgroundColor;
  Widget? leadingWidget;
  double? toolbarHeight;
  double leadingPadding;
  bool? isResult;
  bool isLeadingApplied;

  CustomAppBar(
      {this.trailingWidgets: const [],
      this.showBackBtn: false,
      this.appbarTitle: "",
      this.onPobClick,
      this.backIconColor: ConstantsColors.blackColor,
      this.backgroundColor: ConstantsColors.whiteColor,
      this.leadingWidget,
      this.titleWidget,
      this.leadingPadding: 0,
      this.toolbarHeight,
      this.isResult,
      this.isLeadingApplied = true})
      : super(
            automaticallyImplyLeading: isLeadingApplied,
            leading: showBackBtn
                ? IconButton(
                    padding: EdgeInsetsDirectional.only(
                        start: 10.w, top: 10.h, end: 10.w),
                    icon: Icon(Icons.arrow_back_outlined,
                        size: 22, color: backIconColor),
                    onPressed: () async {
                      if (onPobClick != null) {
                        onPobClick();
                      } else {
                        Navigation(navigatorKey: navigatorKey)
                            .goBack(argument: isResult);
                      }
                    })
                : leadingWidget,
            title: titleWidget ??
                Text(
                  appbarTitle,
                  style: Theme.of(navigatorKey.currentContext!)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                          color: ConstantsColors.whiteColor,
                          fontSize: AppFontSize.medium,
                          fontWeight: FontWeight.bold),
                ),
            centerTitle: false,
            backgroundColor: backgroundColor,
            elevation: 0,
            toolbarHeight: toolbarHeight,
            leadingWidth: leadingWidget == null || showBackBtn ? 30 : 140,
            actions: [
              Container(
                  margin: EdgeInsetsDirectional.only(end: 10.w, bottom: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: trailingWidgets,
                  ))
            ]);
}
