import 'package:flutter/material.dart';
import 'package:soapah/utils/size_utils.dart';

import '../theme/custom_text_theme.dart';
import 'base_button.dart';

class CustomOutlinedButton extends BaseButton {
  const CustomOutlinedButton({
    super.key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
  });
  final BoxDecoration? decoration;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
          alignment: alignment ?? Alignment.center,
          child: buildOutlinedButtonWidget(context),
        )
        : buildOutlinedButtonWidget(context);
  }

  Widget buildOutlinedButtonWidget(BuildContext context) => Container(
    height: height ?? 12.w,
    width: width ?? double.maxFinite,
    margin: margin,
    decoration: decoration,
    child: OutlinedButton(
      style:
          buttonStyle ??
          ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
      onPressed: isDisabled ?? false ? null : onPressed ?? () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftIcon ?? const SizedBox.shrink(),
          Text(
            text,
            style:
                buttonTextStyle ??
                CustomTextStyles.montserratPrimary800LargeBold,
          ),
          rightIcon ?? const SizedBox.shrink(),
        ],
      ),
    ),
  );
}
