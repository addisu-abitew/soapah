import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import '../theme/app_theme.dart';
import '../theme/custom_text_theme.dart';

class CustomDropdown extends StatelessWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final bool filled;
  final InputBorder? borderDecoration;
  final double? width;
  final Decoration? boxDecoration;
  final FocusNode? focusNode;
  final bool autofocus;
  final TextStyle? textStyle;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(dynamic)? onChanged;
  final Widget? icon;

  const CustomDropdown({
    super.key,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.borderDecoration,
    this.autofocus = false,
    this.boxDecoration,
    this.focusNode,
    this.textStyle,
    this.validator,
    this.width,
    this.items,
    this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.maxFinite,
      decoration: boxDecoration,
      child: DropdownButtonFormField(
        items: items,
        focusNode: focusNode,
        autofocus: autofocus,
        style: textStyle ?? CustomTextStyles.montserratBlack900Regular6_1,
        decoration: decoration,
        validator: validator,
        onChanged: onChanged,
        icon:
            icon ??
            Icon(Icons.keyboard_arrow_down_rounded, color: appTheme.black900),
      ),
    );
  }

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle ?? theme.textTheme.bodyLarge,
    isDense: true,
    contentPadding: contentPadding ?? EdgeInsets.all(3.w),
    fillColor: fillColor ?? appTheme.white900,
    filled: filled,

    border:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.w),
          borderSide: BorderSide(color: appTheme.gray100, width: 1),
        ),
    enabledBorder:
        borderDecoration ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.w),
          borderSide: BorderSide(color: appTheme.gray100, width: 1),
        ),
    focusedBorder: (borderDecoration ??
            OutlineInputBorder(borderRadius: BorderRadius.circular(2.w)))
        .copyWith(
          borderSide: BorderSide(color: theme.colorScheme.primary, width: 1),
        ),
  );
}
