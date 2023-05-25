import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roommate/blocs/app_cubit/auth_cubit.dart';
import 'package:roommate/blocs/app_cubit/auth_state.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/utils/tools/device_info_details.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';

class DynamicLink {
  Future<String> buildDynamicLink({required Map<String, dynamic> data}) async {
    String _queryString = jsonEncode(data);
    String url = "https://ouououou.page.link";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: url,
      link: Uri.parse('$url/inApp?$_queryString'),
      androidParameters: AndroidParameters(
        packageName: DeviceInfoDetails().packageInfo?.packageName ?? '',
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: DeviceInfoDetails().packageInfo?.packageName ?? '',
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          description: "Once upon a time in the town",
          imageUrl:
              Uri.parse("https://flutter.dev/images/flutter-logo-sharing.png"),
          title: "Breaking Code's Post"),
    );
    final Uri? dynamicUrl =(await  FirebaseDynamicLinks.instance.buildShortLink(parameters)).shortUrl;
    log(_queryString);
    log("** Dynamic link short url ** : " + dynamicUrl.toString());
    return dynamicUrl.toString();
  }

  Future<bool> initDynamicLinks() async {
    bool hasLink = false;
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    log("** Dynamic link data ** : " + deepLink.toString());
    if (deepLink != null) {
      handleDynamicLink(url: deepLink);
      hasLink = true;
      log("** Dynamic link data ** : " + deepLink.toString());
      final dynamicLink =
      await FirebaseDynamicLinks.instance.getDynamicLink(deepLink!);
      handleDynamicLink(url: deepLink);

      final Uri? deep = dynamicLink?.link;
      log("deeplink found");
      if (deep != null) {
        handleDynamicLink(url: deep);
      }
    }
    FirebaseDynamicLinks.instance.onLink;

    return hasLink;
  }

  handleDynamicLink({required Uri url}) async {
    String _queryString = '';
    for (var entry in url.queryParameters.entries) {
      _queryString = _queryString + entry.key + entry.value;
    }
    Map<String, dynamic> data = jsonDecode(_queryString);
    if (data["path"] == RoutesNames.room) {
      if (navigatorKey.currentState!.context.read<AuthCubit>().state
          is AuthorizedState) {
        log(jsonEncode(data));
        RoomModel _roomModel = roomModelFromJson(jsonEncode(data));
        Navigation(navigatorKey: navigatorKey)
            .navigateAndRemoveUntil(routeName: RoutesNames.room, arg: _roomModel);
      }
    } else {
      Navigation(navigatorKey: navigatorKey)
          .navigateAndRemoveUntil(routeName: RoutesNames.homeScreen);
    }
  }
}
