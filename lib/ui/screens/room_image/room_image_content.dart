import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/models/room_image_model.dart';
import 'package:roommate/ui/screens/room_image/widgets/image_header_widget.dart';
import 'package:roommate/ui/widgets/custom_button.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';
import 'package:roommate/ui/widgets/room_details.dart';

class RoomImageContent extends StatelessWidget {
  const RoomImageContent({
    Key? key,
    required this.roomImageModel,
  }) : super(key: key);
  final RoomImageModel roomImageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: CachedNetworkImageProvider(
            roomImageModel.selectedImage,
          ),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Align(
            alignment: FractionalOffset.topCenter,
            child: ImageHeaderWidget(
                roomTile: roomImageModel.roomModel.title ?? ''),
          )),
          RoomDetailsWidget(
            height: 140.h,
            padding: EdgeInsets.all(13.h),
            radius: 15,
            spaceHeight: 8,
            roomModel: roomImageModel.roomModel,
            backgroundColor: ConstantsColors.blackColor.withOpacity(.5),
            roomTypeColor: ConstantsColors.greyColor,
            roomTitleColor: ConstantsColors.whiteColor,
            roomPriceColor: ConstantsColors.whiteColor,
          ),
          space(27),
          CustomButton.icon(
              width: 1.sw,
              text: context.localization.contact,
              color: ConstantsColors.blue,
              textColor: ConstantsColors.whiteColor,
              radius: 16.r,
              onPressed: () => Helper().callCustomerService(
                  phone: roomImageModel.roomModel.contacts?.phone ?? ''),
              child: const Icon(
                Icons.phone,
                color: ConstantsColors.whiteColor,
              )),
        ],
      ),
    );
  }
}
