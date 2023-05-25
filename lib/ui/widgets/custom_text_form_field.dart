import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roommate/core/constants/app_font_size.dart';
import 'package:roommate/core/theme/colors/config_colors.dart';
import 'package:roommate/core/theme/text_theme.dart';
import 'package:roommate/ui/widgets/custom_text.dart';
import 'package:roommate/ui/widgets/custom_widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final bool? enableSuggestions;
  final bool? autocorrect;
  final bool? obscureText;
  final int? maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final double? hintFontSize;
  final double? textFontSize;
  final Color? textFontColor;
  final double? radius;
  final bool? enabled;
  final bool? isReadOnly;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? label;
  final Color? labelColor;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Function()? onTap;
  final Map<String, dynamic>? errorMessages;
  final String validatorKey;
  final TextAlignVertical? textAlignVertical;
  final double? textPaddingStart;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool isClickable;
  final FontWeight? fontWeight;
  final TextAlign textAlign;
  final double? textHeight;
  final bool enabledBorder;
  const CustomTextFormField(
      {Key? key,
      this.text = '',
      this.hintText = '',
      this.initialValue,
      this.onSaved,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.enableSuggestions,
      this.textCapitalization,
      this.autocorrect,
      this.obscureText,
      this.maxLength,
      this.suffixIcon,
      this.prefixIcon,
      this.prefix,
      this.hintFontSize = 14,
      this.textFontSize,
      this.textFontColor,
      this.radius,
      this.textInputAction,
      this.onFieldSubmitted,
      this.onChanged,
      this.enabled = true,
      this.isReadOnly,
      this.maxLines = 1,
      this.minLines = 1,
      this.inputFormatters,
      this.label,
      this.labelColor,
      this.focusNode,
      this.controller,
      this.onTap,
      this.errorMessages,
      this.textAlignVertical,
      this.validatorKey = '',
      this.textPaddingStart = 3,
      this.backGroundColor,
      this.textHeight = 1,
      this.contentPadding,
      this.fontWeight,
        this.isClickable = true,
        this.textAlign = TextAlign.start, this.enabledBorder =true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool hasSpecificErrorMessage =
        (errorMessages ?? {}).containsKey(validatorKey);
    return Column(
      children: [
        if (label != null)
          CustomText(
            text: label!,
            textMargin: EdgeInsetsDirectional.only(
                bottom: 10.h, start: textPaddingStart!),
            fontSize: AppFontSize.small,
            color: ConstantsColors.secondaryColor,
            fontWeight: FontWeight.w700,
          ),
        TextFormField(
          key: key,
          controller: controller,
          focusNode: focusNode,
          readOnly: isReadOnly ?? false,
          enabled: enabled,
          initialValue: initialValue,
          autocorrect: autocorrect ?? true,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          enableSuggestions: enableSuggestions ?? true,
          textAlignVertical: textAlignVertical,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          obscuringCharacter: '•',
          cursorColor: ConstantsColors.mainBackgroundColor,
          textInputAction: textInputAction,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            errorMaxLines: 2,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            prefix: prefix,
            hintText: hintText,
            contentPadding: contentPadding,
            hintStyle: textTheme.subtitle1!.copyWith(
              color: textFontColor??ConstantsColors.hintTextColor,
              fontSize: hintFontSize,
              fontWeight: fontWeight??FontWeight.w600,
            ),
            labelStyle: TextStyle(color: labelColor),
            fillColor:ConstantsColors.whiteColor,
            filled: true,
            focusColor: ConstantsColors.secondaryBackgroundColor,
            enabledBorder:enabledBorder? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: hasSpecificErrorMessage
                    ? ConstantsColors.redColor
                    : ConstantsColors.bordercolor,
              ), //<-- SEE HERE
              borderRadius: BorderRadius.circular(radius ?? 5.0),
            ):null,
            disabledBorder:enabledBorder? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: hasSpecificErrorMessage
                    ? ConstantsColors.redColor
                    : ConstantsColors.bordercolor,
              ), //<-- SEE HERE
              borderRadius: BorderRadius.circular(radius ?? 5.0),
            ):null,
            focusedBorder:enabledBorder? OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: hasSpecificErrorMessage
                    ? ConstantsColors.redColor
                    : ConstantsColors.bordercolor,
              ), //<-- SEE HERE
              borderRadius: BorderRadius.circular(radius ?? 5.0),
            ):null,
            iconColor: ConstantsColors.secondaryColor,
            counterText: '',
          ),
          textAlign: textAlign,
          style: TextStyle(
            height:textHeight,
            color: textFontColor == null ? enabled! ? ConstantsColors.textFieldlightBlack : ConstantsColors.textFieldlightBlack : ConstantsColors.mainBackgroundColor,
            fontSize:textFontSize?? AppFontSize.small,
            fontWeight:fontWeight?? FontWeight.w700,
          ),
          validator: validator,
          onSaved: onSaved,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          onTap: () {
            if(isClickable) {
              (onTap ?? () {})();
            }
          },
        ),
        //generate space if input text has any error message
        if (hasSpecificErrorMessage) space(5),

        //check if input text has any error message
        if (hasSpecificErrorMessage)
          CustomText(
            text:
                ((errorMessages ?? {})[validatorKey] as List).first.toString(),
            textMargin: EdgeInsetsDirectional.only(bottom: 10.h, start: 10.w),
            fontSize: AppFontSize.mid_small,
            color: ConstantsColors.redColor,
          )
      ],
    );
  }
}
