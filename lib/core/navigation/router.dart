import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:roommate/app.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/ui/screens/login/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  log("Route Name:${settings.name}");
  log("Route arg:${settings.arguments}");
  switch (settings.name) {
    case RoutesNames.loginScreen:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
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
