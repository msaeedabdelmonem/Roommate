import 'package:flutter/material.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/main.dart';
import 'package:roommate/ui/screens/rating/rating_content.dart';
import 'package:roommate/ui/widgets/custom_appbar.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       backIcon: InkWell(
         onTap: ()=>Navigation(navigatorKey: navigatorKey).goBack(),
         child: const Icon(
             Icons.arrow_back_outlined,
             size: 22,
             color: ConstantsColors.blackColor),
       ),
        showBackBtn: true,
        backgroundColor: ConstantsColors.yellowColor,
      ),
      backgroundColor: ConstantsColors.yellowColor,
      body: SafeArea(
        child: RatingContent(),
      ),
    );
  }
}
