import 'package:flutter/material.dart';
import 'package:soapah/presentation/core/utils/size_utils.dart';

import 'custom_text_theme.dart';

LightCodeColors get appTheme => ThemeHelper.themeColor();
ThemeData get theme => ThemeHelper.themeData();

class LightCodeColors {
  // Black
  Color get black900 => Color(0XFF000000);
  // BlueGray
  Color get blueGray100 => Color(0XFFD0D5DD);
  Color get blueGray1003f => Color(0X3FD9D9D9);
  // Gray
  Color get gray100 => Color(0XFFF8F5F7);
  Color get gray200 => Color.fromARGB(255, 189, 187, 189);
  Color get gray10001 => Color(0XFFF2F4F7);
  Color get gray600 => Color(0XFFA35C7A);
  Color get gray650 => Color(0XFFA35C7A);
  Color get gray60001 => Color(0XFF797979);
  Color get gray700 => Color(0XFF5C5252);
  // White
  Color get white900 => Color(0XFFFFFFFF);

  Color get scaffoldBg => Color(0XFFF8F5F7);
}

class ThemeHelper {
  static themeData() {
    var colorScheme = ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: appTheme.scaffoldBg,
      textTheme: TextThemes.textTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.onPrimaryContainer,
          side: BorderSide(color: appTheme.gray100, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.w),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(color: appTheme.blueGray100, width: 1),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray10001,
      ),
    );
  }

  static LightCodeColors themeColor() {
    return LightCodeColors();
  }
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFC890A7),
    onPrimary: Color(0XFF475467),
    onPrimaryContainer: Color(0XFFFFFFFF),
  );
}
