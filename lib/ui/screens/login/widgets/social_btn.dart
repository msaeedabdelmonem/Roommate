import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/ui/widgets/custom_button.dart';

class SocialBtn extends StatelessWidget {
  const SocialBtn(
      {Key? key,
      required this.color,
      required this.onClick,
      required this.imagePath,
      required this.title,
      required this.textColor})
      : super(key: key);
  final Color color;
  final Function onClick;
  final String imagePath;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return CustomButton.icon(
      width: 1.sw,
      height: 45.h,
      text: title,
      onPressed:()=> onClick(),
      child: SvgPicture.asset(imagePath),
      radius: 20,
      color: color,
      textSize: AppFontSize.small,
      textColor: textColor,
    );
  }
}
