import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key, required this.profileModel}) : super(key: key);
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        profileModel.image != null
            ? Container(
                width: 100.w,
                height: 120.h,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70.0.r),
                  child: CachedNetworkImage(
                    imageUrl: profileModel.image ?? "",
                    width: 1.sw,
                    height: 190.h,
                    fit: BoxFit.contain,
                    useOldImageOnUrlChange: true,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              )
            : SvgPicture.asset(ImagePaths.profileImage),
        space(24),
        CustomText(
          text: profileModel.name ?? '',
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
              color: ConstantsColors.blackColor, fontSize: AppFontSize.x_large),
        ),
        space(3),
        CustomText(
          text: profileModel.mail ?? '',
          alignment: AlignmentDirectional.center,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: ConstantsColors.greyColor, fontSize: AppFontSize.mid_small),
        ),
      ],
    );
  }
}
