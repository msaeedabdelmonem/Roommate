import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roommate/blocs/home/home_cubit.dart';
import 'package:roommate/blocs/localization/localization.dart';
import 'package:roommate/blocs/search/search_date_cubit.dart';
import 'package:roommate/blocs/search/search_field_cubit.dart';
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
    required this.onBack,
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
  final Function onBack;

  @override
  Widget build(BuildContext context) {
    final hasText = useState(false);
    final node = useFocusNode();
    if(!hasText.value) {
      node.requestFocus();
    }


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
          focusNode: node,
          controller: controller,
          onComplete: () => onSearch(context, controller, node),
          textHeight: 1.2,
          enabledBorder: enabledBorder,
          labelColor: ConstantsColors.blackColor,
          onChanged: (value) {
            hasText.value = true;
          },
          prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 8.h, start: 15.w, end: 10.w, bottom: 10.h),
              child: InkWell(
                onTap: () => onBack(),
                child: Icon(
                  Icons.arrow_back,
                  color: ConstantsColors.blackColor,
                  size: 25,
                ),
              )),
          suffixIcon: hasText.value
              ? Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 8.h, start: 15.w, end: 10.w, bottom: 10.h),
                  child: InkWell(
                    onTap: () {
                      hasText.value = false;
                      controller.clear();
                    },
                    child: Icon(
                      Icons.close,
                      color: ConstantsColors.greyColor,
                      size: 25,
                    ),
                  ))
              : SizedBox(),
          radius: 16.r,
          hintText: context.localization.search,
          maxLength: 200,
          enabled: enabled,
          fontWeight: FontWeight.w700,
          textFontSize: AppFontSize.medium,
          validator: (value) => Validator.requiredValidator(
              value: value, key: context.localization.search),
        ),
      ),
    );
  }

  void onSearch(
      BuildContext context, TextEditingController controller, FocusNode node) {
    formKey!.currentState!.save();
    if (controller.text.isNotEmpty && controller.text.length >= 3 && enabled) {
      node.unfocus();
      context.read<SearchDataCubit>().searchRooms(title: controller.text);
    }
  }
}
