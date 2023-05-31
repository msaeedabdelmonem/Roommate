import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/blocs/profile/profile_cubit.dart';
import 'package:roommate/blocs/search/location_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/tools/device_info_details.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/ui/screens/profile/widgets/profile_header.dart';
import 'package:roommate/ui/screens/profile/widgets/profile_item.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

import '../../widgets/custom_text.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.profileModel})
      : super(key: key);
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 37.h, right: 20.w, left: 20.w),
      child: Column(
        children: [
          ProfileHeader(profileModel: profileModel),
          space(74),
          ProfileItem(
              iconPath: ImagePaths.list,
              trailingWidget: Icon(
                Icons.arrow_forward_ios,
                color: ConstantsColors.lightGreyColor,
                size: 22,
              ),
              title: context.localization.listRooms,
              subTitle: context.localization.soon,
              onClick: () {}),
          ProfileItem(
              iconPath: ImagePaths.all,
              trailingWidget: Icon(
                Icons.arrow_forward_ios,
                color: ConstantsColors.lightGreyColor,
                size: 22,
              ),
              title: context.localization.roomPref,
              subTitle: context.localization.soon,
              onClick: () {}),
          ProfileItem(
              iconPath: ImagePaths.language,
              trailingWidget: CupertinoSwitch(
                  activeColor: ConstantsColors.mainBackgroundColor,
                  thumbColor: ConstantsColors.whiteColor,
                  trackColor: ConstantsColors.lightGreyColor,
                  value:
                      context.watch<LocalizationCubit>().state.languageCode ==
                          'en',
                  onChanged: (value) async {
                    changeLanguage(context: context);
                  }),
              title: context.localization.language,
              subTitle: context.localization.langName,
              onClick: () {          changeLanguage(context: context);}),
          space(10),
          InkWell(
            onTap: (){
              context.read<ProfileCubit>().logOut();
            },
            child: Row(
              children: [
                SvgPicture.asset(ImagePaths.logout),
                space(0, 15),
                CustomText(
                  text: context.localization.logout,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ConstantsColors.blackColor,
                      fontSize: AppFontSize.x_medium),
                ),
              ],
            ),
          ),
          space(80),
          CustomText(
            text: context.localization
                .version(DeviceInfoDetails().packageInfo!.version),
            maxLines: 1,
            alignment: AlignmentDirectional.center,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ConstantsColors.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: AppFontSize.mid_small),
          ),
        ],
      ),
    );
  }
  void changeLanguage({required BuildContext context}){
    if (context.read<LocalizationCubit>().state.languageCode == 'ar') {
      context.read<LocalizationCubit>().updateLocaleToEnglish();
    } else {
      context.read<LocalizationCubit>().updateLocaleToArabic();
    }
  }
}
