import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roommate/app.dart';
import 'package:roommate/core/DI/dependency_injector.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await DependencyInjector().injectModules();
  // SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => RoommateApp(),
    ),
  );
}
