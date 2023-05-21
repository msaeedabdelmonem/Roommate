import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Helper? _instance;

  Helper._internal();

  factory Helper() {
    return _instance ??= Helper._internal();
  }

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
  void share(String title){
    Share.share("You are invited to book this room",
        subject: title);
  }
}
