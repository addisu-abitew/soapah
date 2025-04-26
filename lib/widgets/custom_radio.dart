import 'package:flutter/material.dart';

import '../theme/custom_text_theme.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final double? width;
  final double? iconSize;
  final Function(T?) onChanged;
  final String title;
  final bool isRightRadio;
  final bool isExpandedText;
  final TextAlign? textAlignment;
  final TextStyle? textStyle;
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.isRightRadio = false,
    this.isExpandedText = false,
    this.iconSize,
    this.width,
    this.textAlignment,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: SizedBox(
        width: width,
        child: isRightRadio ? rightSideCheckbox : leftSideCheckbox,
      ),
    );
  }

  Widget get leftSideCheckbox => Row(
    children: [
      Padding(padding: EdgeInsets.only(right: 8), child: checkboxWidget),
      isExpandedText ? Expanded(child: textWidget) : textWidget,
    ],
  );
  Widget get rightSideCheckbox => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      isExpandedText ? Expanded(child: textWidget) : textWidget,
      Padding(padding: EdgeInsets.only(left: 8), child: checkboxWidget),
    ],
  );
  Widget get textWidget => Text(
    title,
    textAlign: textAlignment ?? TextAlign.start,
    style: textStyle ?? CustomTextStyles.montserratBlack900Regular6_1,
  );
  Widget get checkboxWidget => SizedBox(
    height: iconSize,
    width: iconSize,
    child: Radio(
      visualDensity: VisualDensity(vertical: -4, horizontal: -4),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    ),
  );
}
