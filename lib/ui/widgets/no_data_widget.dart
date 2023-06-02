import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/ui/widgets/custom_text.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1.sh,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomText(
            text: 'No available rooms yet',
            alignment: AlignmentDirectional.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ConstantsColors.blackColor,
                  fontSize: AppFontSize.medium,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ]),
      ),
    );
  }
}
