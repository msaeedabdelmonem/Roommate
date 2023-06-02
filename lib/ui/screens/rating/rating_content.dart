import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_button.dart';

class RatingContent extends StatelessWidget {
  const RatingContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
      child: Column(
        children: [
          SvgPicture.asset(_renderImage(context: context)),
          Expanded(
              child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: CustomButton.icon(
                width: 1.sw,
                text: context.localization.rate,
                color: ConstantsColors.whiteColor,
                textColor: ConstantsColors.blue,
                radius: 16.r,
                onPressed: () {},
                child: const Icon(
                  Icons.star_border,
                  color: ConstantsColors.blue,
                )),
          ))
        ],
      ),
    );
  }

  String _renderImage({required BuildContext context}) {
    if (context.read<LocalizationCubit>().state.languageCode == 'en') {
      return ImagePaths.rating;
    } else {
      return ImagePaths.ratingAr;
    }
  }
}
