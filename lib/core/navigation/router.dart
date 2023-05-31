import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:roommate/app.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/models/profile/profile_model.dart';
import 'package:roommate/models/room_image_model.dart';
import 'package:roommate/ui/screens/home/home_screen.dart';
import 'package:roommate/ui/screens/login/login_screen.dart';
import 'package:roommate/ui/screens/profile/profile_screen.dart';
import 'package:roommate/ui/screens/rating/rating_screen.dart';
import 'package:roommate/ui/screens/room/room_screen.dart';
import 'package:roommate/ui/screens/room_image/room_image_screen.dart';
import 'package:roommate/ui/screens/search/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  log("Route Name:${settings.name}");
  log("Route arg:${settings.arguments}");
  switch (settings.name) {
    case RoutesNames.loginScreen:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case RoutesNames.homeScreen:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
    case RoutesNames.room:
      return MaterialPageRoute(
        builder: (context) =>
            RoomScreen(roomModel: settings.arguments as RoomModel),
      );
    case RoutesNames.roomImageScreen:
      return MaterialPageRoute(
        builder: (context) =>
            RoomImageScreen(roomImageModel: settings.arguments as RoomImageModel),
      );

    case RoutesNames.ratingScreen:
      return MaterialPageRoute(
        builder: (context) =>
            RatingScreen(),
      );
    case RoutesNames.searchScreen:
      return MaterialPageRoute(
        builder: (context) =>
            SearchScreen(),
      );
    case RoutesNames.profileScreen:
      return MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(profileModel: settings.arguments as ProfileModel),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => RoommateApp(),
      );
  }
}

// Route<dynamic> generateMoreRoutes(RouteSettings settings) {
//   log("Route Name:${settings.name}");
//   log("Route arg:${settings.arguments}");
//   switch (settings.name) {
//     case MoreRoutes.menuScreen:
//       return MaterialPageRoute(
//         builder: (context) => MoreScreen(),
//       );
//
//     default:
//       return MaterialPageRoute(
//         builder: (context) => MoreScreen(),
//       );
//   }
// }
