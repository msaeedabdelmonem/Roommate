import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/login/login_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/ui/screens/login/widgets/slider_item.dart';
import 'package:roommate/ui/screens/login/widgets/slider_list.dart';
import 'package:roommate/ui/screens/login/widgets/social_btn.dart';
import 'package:roommate/ui/widgets/custom_button.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagePaths.login_background),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(children: [
        Container(
          height: 50.h,
          margin: EdgeInsets.symmetric(vertical: 67.h),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImagePaths.logo),
                space(0, 21),
                CustomText(
                  text: context.localization.appName,
                  alignment: AlignmentDirectional.center,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ConstantsColors.whiteColor,
                      fontSize: AppFontSize.x_large,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
        space(200),
        SizedBox(
          height: 200.h,
          child: SliderList(),
        ),
        space(30),
        SocialBtn(
          color: ConstantsColors.blue,
          onClick: () => context.read<LoginCubit>().signInWithFaceBook(),
          imagePath: ImagePaths.faceBook,
          title: context.localization.facebook_login,
          textColor: ConstantsColors.whiteColor,
        ),
        space(10),
        SocialBtn(
            color: ConstantsColors.whiteColor,
            onClick: () => context.read<LoginCubit>().signInWithGoogle(),
            imagePath: ImagePaths.google,
            textColor: ConstantsColors.blue,
            title: context.localization.google_login),
        space(10),
        SocialBtn(
            color: ConstantsColors.whiteColor,
            onClick: () {
              Navigation(navigatorKey: navigatorKey)
                  .navigateAndRemoveUntil(routeName: RoutesNames.homeScreen);
            },
            imagePath: ImagePaths.apple,
            textColor: ConstantsColors.blackColor,
            title: context.localization.appleLogin),
      ]),
    );
  }
}
