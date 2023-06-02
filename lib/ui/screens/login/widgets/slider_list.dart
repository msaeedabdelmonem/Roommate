import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/login/slider_cubit.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/screens/login/widgets/slider_item.dart';

class SliderList extends StatelessWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sliderList = [
      SliderItem(title: context.localization.loginTitle1,subTitle: context.localization.loginDesc1,),
      SliderItem(title: context.localization.loginTitle2,subTitle: context.localization.loginDesc2,),
      SliderItem(title: context.localization.loginTitle3,subTitle: context.localization.loginDesc3,)
    ];

    final CarouselController controller = CarouselController();
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: sliderList,
          carouselController: controller,
          options: CarouselOptions(
            height: 300.h,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) =>
                context.read<SliderCubit>().emitNextPage(index),
          ),
        ),
      ),
      BlocBuilder<SliderCubit, int>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sliderList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => controller.animateToPage(entry.key),
              child: Container(
                width: 10.0.w,
                height: 10.0.h,
                margin:
                    EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 4.0.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ConstantsColors.whiteColor
                        .withOpacity(state == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        );
      })
    ]);
  }
}
