import 'package:flutter/material.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/utils/tools/dynamic_link.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Helper? _instance;

  Helper._internal();

  factory Helper() {
    return _instance ??= Helper._internal();
  }

  ScrollController? bottomSheetScrollable;

  callCustomerService({required String phone}) async {
    final Uri _url = Uri.parse('tel:$phone');
    if (await canLaunchUrl(_url)) {
      final contacts = await launchUrl(_url);
      await Future.delayed(const Duration(seconds: 1));
      if (contacts) {
        Navigation(navigatorKey: navigatorKey)
            .navigateTo(routeName: RoutesNames.ratingScreen);
      }
    }
  }

  Future<void> share(RoomModel roomModel) async {
    String dynamicLink =
        await DynamicLink().buildDynamicLink(data: roomModel.toJson());
    Share.share("You are invited to book this room $dynamicLink",
        subject: roomModel.title);
  }

  void showBottomSheet(
      { required Widget widget,bool isLocation=false}) {
    showModalBottomSheet(
      context: navigatorKey.currentState!.context,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Container(
          color: Color.fromRGBO(0, 0, 0, 0.001),
          child: DraggableScrollableSheet(
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize:isLocation?0.75: 0.50,
            builder: (ctx, controller) {
              bottomSheetScrollable = controller;
              return widget;
            },
          ),
        );
      },
    );
  }
}
