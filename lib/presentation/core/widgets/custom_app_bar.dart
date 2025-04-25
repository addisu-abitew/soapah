import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final ShapeBorder? shape;
  final double? leadingWidth;
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.height,
    this.shape,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(SizeUtils.width, height ?? 56.w);
}
