import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/ui/screens/home/widgets/header_widget.dart';
import 'package:roommate/ui/screens/home/widgets/room_list_widget.dart';
import 'package:roommate/ui/widgets/searh_widget.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: const [
          HeaderWidget(),
          SearchWidget(enabled: false),
          Expanded(
            child: RoomListWidget(),
          )
        ],
      ),
    );
  }
}
