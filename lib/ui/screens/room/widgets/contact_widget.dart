import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/helper.dart';
import 'package:roommate/core/utils/snackbar_presenter.dart';
import 'package:roommate/main.dart';
import 'package:roommate/models/home/room_model.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key, required this.contacts}) : super(key: key);
  final Contacts contacts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ConstantsColors.whiteColor,
          border: Border(
            top: BorderSide(color: ConstantsColors.grayShadeColor),
          )),
      height: 64.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Contact the owner',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ConstantsColors.blackColor,
                      fontSize: AppFontSize.x_medium,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              space(3),
              CustomText(
                text: 'Subtitle here',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ConstantsColors.greyColor,
                      fontSize: AppFontSize.mid_small,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              contacts.phone != null
                  ? InkWell(
                      onTap: () => Helper()
                          .callCustomerService(phone: contacts.phone ?? ''),
                      child: SvgPicture.asset(ImagePaths.phone))
                  : SizedBox(),
              space(0, 12),
              contacts.messanger != null
                  ? InkWell(
                      onTap: () => openMessenger(),
                      child: SvgPicture.asset(ImagePaths.messenger))
                  : SizedBox(),
              space(0, 12),
              contacts.whatsApp != null
                  ? InkWell(
                      onTap: () => openWhatsApp(context),
                      child: SvgPicture.asset(ImagePaths.whatsapp))
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }

  Future<void> openWhatsApp(BuildContext context) async {
     Uri? _url ;
    if (Platform.isAndroid) {
      // add the [https]
      _url = Uri.parse("https://wa.me/${contacts.whatsApp}/?text=${Uri.parse('')}"); // new line
    } else {
      // add the [https]
      _url = Uri.parse( "https://api.whatsapp.com/send?phone=${contacts.whatsApp}=${Uri.parse('')}"); // new line
    }
    if (await canLaunchUrl(_url)) {
      final whats = await launchUrl(_url);
      await Future.delayed(const Duration(seconds: 1));
      if (whats) {
        Navigation(navigatorKey: navigatorKey)
            .navigateTo(routeName: RoutesNames.ratingScreen);
      }
    } else {
      context.showNotice(Notice(
          message: 'No whats app available right now', isErrorMesage: true));
    }
  }
  Future<void> openMessenger() async {
    final Uri _url = Uri.parse("https://${contacts.messanger}");
    if (await canLaunchUrl(_url)) {
      final messenger = await launchUrl(_url);
      await Future.delayed(const Duration(seconds: 1));
      if (messenger) {
        Navigation(navigatorKey: navigatorKey)
            .navigateTo(routeName: RoutesNames.ratingScreen);
      }
    }
  }
}
