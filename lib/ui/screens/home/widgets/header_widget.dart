import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/DI/dependency_injector.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/data_sources/local/shared_perference.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImagePaths.logo),
                space(0, 21),
                CustomText(
                  text: context.localization.appName,
                  alignment: AlignmentDirectional.center,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: ConstantsColors.blackColor,
                      fontSize: AppFontSize.x_x_x_large,
                      fontWeight: FontWeight.w700),
                )
              ]),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigation(navigatorKey: navigatorKey)
                        .navigateTo(routeName: RoutesNames.searchScreen);
                  },
                  child: SvgPicture.asset(ImagePaths.search)),
              space(0, 16),
              InkWell(
                  onTap: () async {
                    Navigation(navigatorKey: navigatorKey).navigateTo(
                        routeName: RoutesNames.profileScreen,
                        arg:(await diInstance<SharedPreferencesHelper>().getUserData())==null?
                         ProfileModel():
                        profileModelFromJson(await diInstance<SharedPreferencesHelper>().getUserData()??''));
                  },
                  child: SvgPicture.asset(ImagePaths.profile))
            ],
          )
          // SvgPicture.asset(ImagePaths.person)
        ],
      ),
    );
  }
}
