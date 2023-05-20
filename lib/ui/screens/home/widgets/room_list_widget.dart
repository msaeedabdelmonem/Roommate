import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/screens/home/widgets/room_widget.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class RoomListWidget extends StatelessWidget {
  const RoomListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final testList = [
      RoomModel(
          type: 'Single room',
          title: 'Nice Double Room with Own Bathroom',
          price: 650,
          desc:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
          images: [ImagePaths.room, ImagePaths.room],
          city: 'Nasr city'),
      RoomModel(
          type: 'Single room',
          title: 'Nice Double Room with Own Bathroom',
          price: 650,
          desc:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
          images: [ImagePaths.room, ImagePaths.room],
          city: 'Nasr city'),
      RoomModel(
          type: 'Single room',
          title: 'Nice Double Room with Own Bathroom',
          price: 650,
          desc:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.',
          images: [ImagePaths.room, ImagePaths.room],
          city: 'Nasr city')
    ];
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      itemBuilder: (BuildContext context, int index) {
        return RoomWidget(roomModel: testList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return space(24);
      },
      itemCount: testList.length,
    );
  }
}
