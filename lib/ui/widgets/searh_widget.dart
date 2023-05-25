import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/constants/image_paths.dart';
import 'package:roommate/core/constants/routes.dart';
import 'package:roommate/core/navigation/navigation.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/utils/validator_util.dart';
import 'package:roommate/main.dart';
import 'package:roommate/ui/widgets/custom_text_form_field.dart';

class SearchWidget extends HookWidget {
  const SearchWidget({
    Key? key,
    this.enabledBorder = true,
    this.enabled = true,
    this.isSearchApplied = false,
    this.formKey,
  }) : super(key: key);
  final bool enabledBorder;
  final bool enabled;
  final bool isSearchApplied;
  final GlobalKey<FormState>? formKey;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    return InkWell(
      onTap: () {
        if (!enabled) {
          Navigation(navigatorKey: navigatorKey)
              .navigateTo(routeName: RoutesNames.searchScreen);
        }
      },
      child: Form(
        key: formKey,
        child: CustomTextFormField(
          controller: controller,
          onComplete: () => onSearch(context, controller),
          textHeight: 1.2,
          enabledBorder: enabledBorder,
          labelColor: ConstantsColors.textBlackColor.withOpacity(.40),
          prefixIcon: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 8.h, start: 15.w, end: 10.w, bottom: 10.h),
            child: isSearchApplied
                ? InkWell(
              onTap: ()=>Navigation(navigatorKey: navigatorKey).goBack(),
                  child: Icon(
                      Icons.arrow_back,
                      color: ConstantsColors.blackColor,
                      size: 21,
                    ),
                )
                : SvgPicture.asset(
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
        ),
      ),
    );
  }

  void onSearch(BuildContext context, TextEditingController controller) {
    formKey!.currentState!.save();
    if (controller.text.isNotEmpty && controller.text.length >= 3&&enabled) {

      context.read<SearchDataCubit>().searchRooms(title: controller.text);
     Navigation(navigatorKey: navigatorKey).goBack();
    }
  }
}
