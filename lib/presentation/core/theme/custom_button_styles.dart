import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import 'app_theme.dart';

class CustomButtonStyles {
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray600,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.w)),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimaryTL16 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get fillPrimaryTL20 => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  // Outline button style
  static ButtonStyle get outlineGrayTL20 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.onPrimaryContainer,
    side: BorderSide(color: appTheme.gray100, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.w)),
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get outlineGrayTL201 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    side: BorderSide(color: appTheme.gray100, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlineGrayTL26 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    side: BorderSide(color: appTheme.gray100, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlineGrayTL6 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.gray100,
    side: BorderSide(color: appTheme.gray100, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.h)),
    padding: EdgeInsets.zero,
  );

  static ButtonStyle get outlineGrayTL61 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    side: BorderSide(color: appTheme.gray100, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.h)),
    padding: EdgeInsets.zero,
  );
  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.onPrimaryContainer,
    side: BorderSide(color: theme.colorScheme.primary, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
    padding: EdgeInsets.zero,
  );

  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.transparent),
    elevation: WidgetStateProperty.all<double>(0),
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: WidgetStateProperty.all<BorderSide>(
      BorderSide(color: Colors.transparent),
    ),
  );
}
