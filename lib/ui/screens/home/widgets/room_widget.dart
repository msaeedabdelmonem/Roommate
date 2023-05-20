import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    Key? key,
    required this.roomModel,
    this.showSliderImages = false,
  }) : super(key: key);
  final RoomModel roomModel;
  final bool showSliderImages;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigation(navigatorKey: navigatorKey)
          .navigateTo(routeName: RoutesNames.room, arg: roomModel),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///show slider images
          showSliderImages
              ? const SizedBox()
              : RoomImages(
                  image: roomModel.images?.first ?? '',
                ),
          space(12),
          RichText(
            maxLines: 2,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: roomModel.type,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        color: ConstantsColors.blackColor,
                      ),
                ),
                TextSpan(
                  text: ' in ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        color: ConstantsColors.greyColor,
                      ),
                ),
                TextSpan(
                  text: roomModel.city,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        color: ConstantsColors.blue,
                      ),
                )
              ],
            ),
          ),
          space(6),
          CustomText(
            text: roomModel.title ?? '',
            maxLines: 2,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ConstantsColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: AppFontSize.x_medium,
                ),
          ),
          space(6),
          RichText(
            maxLines: 1,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '${roomModel.price} EGP ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.x_large,
                        fontWeight: FontWeight.w700,
                        color: ConstantsColors.blackColor,
                      ),
                ),
                TextSpan(
                  text: 'per month',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: AppFontSize.smallMedium,
                        color: ConstantsColors.greyColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoomImages extends StatelessWidget {
  const RoomImages({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16.0.r), child: Image.asset(image));
  }
}
