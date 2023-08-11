import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/localization/localization_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/models/room_image_model.dart';
import 'package:roommate/ui/screens/home/widgets/room_widget.dart';
import 'package:roommate/ui/screens/room/widgets/contact_widget.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RoomContent extends StatelessWidget {
  const RoomContent({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.0.h),
      child: ListView(
        children: [
          SizedBox(
            height: 200.h,
            child: CarouselSlider(
              items: List.generate(
                roomModel.images!.length,
                (index) => InkWell(
                  onTap: () => _onImageClick(imageIndex: index),
                  child: RoomImages(
                    image: roomModel.images?[index] ?? '',
                  ),
                ),
              ),
              options: CarouselOptions(
                  height: 300.h,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  autoPlay: true,
                  enableInfiniteScroll: false),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: RoomWidget(
              roomModel: roomModel,
              showSliderImages: true,
            ),
          ),
          space(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(
              height: 1,
              color: ConstantsColors.lightGreyColor,
              thickness: 1,
            ),
          ),
          space(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomText(
              text: context.localization.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ConstantsColors.greyColor,
                    fontSize: AppFontSize.smallMedium,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
          space(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomText(
              maxLines: 30,
              textHeight: 24,
              text: _renderRoomDesc(context: context) ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ConstantsColors.blackColor,
                    fontSize: AppFontSize.x_medium,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _onImageClick({required int imageIndex}) {
    Navigation(navigatorKey: navigatorKey).navigateTo(
      routeName: RoutesNames.roomImageScreen,
      arg: RoomImageModel(
          selectedImage: roomModel.images![imageIndex], roomModel: roomModel),
    );
  }

  String? _renderRoomDesc({required BuildContext context}) {
    if (context.read<LocalizationCubit>().state.languageCode == 'en') {
      return roomModel.desc;
    } else {
      return roomModel.descAr;
    }
  }
}
