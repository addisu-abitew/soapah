import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soapah/utils/size_utils.dart';

import '../theme/app_theme.dart';
import '../theme/custom_text_theme.dart';

class NavigationHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  const NavigationHeader({
    super.key,
    required this.title,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => context.pop(),
          child: CircleAvatar(
            radius: 4.w,
            backgroundColor: appTheme.black900,
            child: Icon(Icons.arrow_back_rounded),
          ),
        ),
        SizedBox(width: 3.w),
        Text(title, style: CustomTextStyles.montserratBlackLarge800),
        Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
