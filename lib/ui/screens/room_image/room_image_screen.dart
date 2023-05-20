import 'package:flutter/material.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/models/room_image_model.dart';
import 'package:roommate/ui/screens/room_image/room_image_content.dart';
import 'package:roommate/ui/widgets/custom_appbar.dart';

class RoomImageScreen extends StatelessWidget {
  const RoomImageScreen({Key? key, required this.roomImageModel})
      : super(key: key);
  final RoomImageModel roomImageModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstantsColors.blackColor,
        body: RoomImageContent(
          roomImageModel: roomImageModel,
        ));
  }
}
