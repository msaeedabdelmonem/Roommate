import 'package:flutter/material.dart';
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
        child: Icon(Icons.share),
          onTap: () {
            Share.share("You are invited to book this room",
                subject: roomModel.title);
          },
        )
      ]),
      body: SafeArea(
        child: RoomContent(roomModel: roomModel),
      ),
    );
  }
}
