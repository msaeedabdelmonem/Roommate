import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/validator_util.dart';
import 'package:roommate/ui/widgets/custom_text_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, this.enabledBorder = true,this.enabled=true, this.isSearchApplied =false}) : super(key: key);
  final bool enabledBorder;
  final bool enabled;
  final bool isSearchApplied;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textHeight: 1.2,
      enabledBorder: enabledBorder,
      labelColor: ConstantsColors.textBlackColor.withOpacity(.40),
      prefixIcon: Padding(
        padding: EdgeInsetsDirectional.only(
            top: 8.h, start: 15.w, end: 10.w, bottom: 10.h),
        child:isSearchApplied?Icon(Icons.arrow_back): SvgPicture.asset(
          ImagePaths.search,
        ),
      ),
      radius: 16.r,
      hintText: context.localization.search,
      maxLength: 200,
      enabled: enabled,
      textFontSize: AppFontSize.medium,
      validator: (value) => Validator.requiredValidator(
          value: value, key: context.localization.search),
    );
  }
}
