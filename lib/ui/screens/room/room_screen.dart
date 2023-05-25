import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/screens/room/room_content.dart';
import 'package:roommate/ui/widgets/custom_appbar.dart';
import 'package:share_plus/share_plus.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showBackBtn: true, trailingWidgets: [
        InkWell(
        child: SvgPicture.asset(ImagePaths.share,height: 22.h,),
          onTap: () {
            Helper().share(roomModel);
          },
        )
      ]),
      body: SafeArea(
        child: RoomContent(roomModel: roomModel),
      ),
    );
  }
}
