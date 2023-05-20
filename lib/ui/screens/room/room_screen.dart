import 'package:flutter/material.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/screens/room/room_content.dart';
import 'package:roommate/ui/widgets/custom_appbar.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(showBackBtn: true, trailingWidgets: [Icon(Icons.share)]),
      body: SafeArea(
        child: RoomContent(roomModel: roomModel),
      ),
    );
  }
}
