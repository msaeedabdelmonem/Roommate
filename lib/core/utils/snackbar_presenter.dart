import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

extension NoticePresenter on BuildContext {
  static const Duration _snackBarDisplayDuration = Duration(seconds: 2);

  /// Show snackbar with default app theme and configurations
  ///
  /// For an action to be shown, [actionTitle] and [action] should not be `null`
  showNotice(Notice notice, {double height = 200}) {
    showFlash(
      context: this,
      duration: _snackBarDisplayDuration,
      persistent: true,
      builder: (_, controller) {
        return Flash(
            margin: EdgeInsets.only(top: 35.h, left: 15.w, right: 15.w),
            behavior: FlashBehavior.fixed,
            position: FlashPosition.top,
            useSafeArea: false,
            borderRadius: BorderRadius.circular(8.r),
            borderColor: notice.isErrorMesage
                ? ConstantsColors.errorBorder
                : ConstantsColors.mainBackgroundColor.withOpacity(0.3),
            //boxShadows: kElevationToShadow[8],
            backgroundColor: notice.isErrorMesage
                ? ConstantsColors.redColor.withOpacity(.3)
                : ConstantsColors.warningColorsecondary,
            onTap: () => controller.dismiss(),
            // forwardAnimationCurve: Curves.easeInCirc,
            // reverseAnimationCurve: Curves.bounceIn,
            borderWidth: 2.w,
            controller: controller,
            child: FlashBar(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                content: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          notice.isErrorMesage
                              ? ImagePaths.warningError
                              : ImagePaths.warningSuccess,
                          width: 33.w,
                          height: 33.h,
                        ),
                        space(0, 8),
                        CustomText(
                          text: notice.message,
                          alignment: AlignmentDirectional.center,
                          style: Theme.of(this).textTheme.bodyLarge?.copyWith(
                              color: (notice.isErrorMesage
                                  ? ConstantsColors.whiteColor
                                  : ConstantsColors.mainBackgroundColor),
                              fontSize: AppFontSize.x_medium,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    notice.subMessage != null && notice.subMessage != ""
                        ? Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: notice.subMessage != null ||
                                        notice.subMessage != ""
                                    ? 39.w
                                    : 0.h),
                            child: CustomText(
                              text: notice.subMessage == null
                                  ? notice.message
                                  : notice.subMessage ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(this)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      height: 1,
                                      fontSize: AppFontSize.small,
                                      fontWeight: FontWeight.w400),
                            ),
                          )
                        : const SizedBox()
                  ],
                )));
      },
    );

    // final snackBar = SnackBar(
    //   content: Container(
    //     width: MediaQuery.of(navigatorKey.currentState!.context).size.width,
    //     padding: EdgeInsets.all(10.w),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         SvgPicture.asset(
    //           notice.isErrorMesage ? ImagePaths.warningError : ImagePaths.warningSuccess,
    //           width: 33.w,
    //           height: 33.h,
    //         ),
    //         space(0,15),
    //         notice.subMessage!=null ?
    //         Expanded(
    //           child: Wrap(
    //             children: [
    //               CustomText(
    //                 text: notice.message,
    //                 style: Theme.of(navigatorKey.currentState!.context)
    //                     .textTheme
    //                     .bodyLarge
    //                     ?.copyWith(
    //                         color: (notice.isErrorMesage
    //                             ? ConstantsColors.errorColormain
    //                             : ConstantsColors.mainBackgroundColor),
    //                         fontSize: AppFontSize.x_medium,
    //                     fontFamily: GoogleFonts.cairo().fontFamily,
    //                         fontWeight: FontWeight.w400
    //                 ),
    //               ),
    //               CustomText(
    //                 text: notice.subMessage ?? '',maxLines: 3,overflow: TextOverflow.ellipsis,
    //                 style: Theme.of(navigatorKey.currentState!.context)
    //                     .textTheme
    //                     .bodyMedium
    //                     ?.copyWith(
    //                       fontSize: AppFontSize.small,
    //                     fontFamily: GoogleFonts.cairo().fontFamily,
    //                     fontWeight: FontWeight.w400
    //                     ),
    //               )
    //             ],
    //           ),
    //         )
    //             :
    //         CustomText(
    //           text: notice.message,
    //           style: Theme.of(navigatorKey.currentState!.context)
    //               .textTheme
    //               .bodyLarge
    //               ?.copyWith(
    //               color: (notice.isErrorMesage
    //                   ? ConstantsColors.errorColormain
    //                   : ConstantsColors.mainBackgroundColor),
    //               fontSize: AppFontSize.x_medium,
    //               fontFamily: GoogleFonts.cairo().fontFamily,
    //               fontWeight: FontWeight.w400
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   behavior: SnackBarBehavior.floating,
    //   padding: EdgeInsets.all(5),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(10.r),
    //     side:  BorderSide(
    //       color: notice.isErrorMesage ? ConstantsColors.errorBorder: ConstantsColors.mainBackgroundColor.withOpacity(0.3),
    //       width: 2.0, // Underline thickness
    //     ),
    //   ),
    //   backgroundColor: notice.isErrorMesage ? ConstantsColors.errorColorsecondary: ConstantsColors.warningColorsecondary,
    //   margin:
    //   EdgeInsets.only(bottom: 1.sh - height.h , top: 70.h, right: 20.w, left: 20.w),
    //   duration: notice.duration ?? _snackBarDisplayDuration,
    //   action: (notice.action != null && notice.actionCallback != null)
    //       ? SnackBarAction(
    //           label: notice.action!,
    //           onPressed: () => notice.actionCallback?.call(),
    //         )
    //       : null,
    // );
    //
    // ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}

/// Used to hold the data needed for notice presenter
class Notice {
  Notice(
      {required this.message,
      this.action,
      this.actionCallback,
      this.subMessage,
      this.isErrorMesage = false,
      this.duration});

  /// Message
  String message;

  /// Message
  String? subMessage;

  /// Action title
  String? action;

  /// Action callback
  Function? actionCallback;

  /// snackbar duration
  Duration? duration;
  bool isErrorMesage;
}
