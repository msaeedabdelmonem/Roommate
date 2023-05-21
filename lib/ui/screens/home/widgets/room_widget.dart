import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:roommate/ui/widgets/room_details.dart';

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
          RoomDetailsWidget(roomModel: roomModel)
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
    return
      ClipRRect(
      borderRadius: BorderRadius.circular(16.0.r),
      child: CachedNetworkImage(
        imageUrl: image,
        width: 1.sw,
        height: 190.h,
        fit: BoxFit.fitWidth,
        useOldImageOnUrlChange: true,
        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
