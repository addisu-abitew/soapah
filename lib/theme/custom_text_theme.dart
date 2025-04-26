import 'package:flutter/material.dart';
import 'package:soapah/theme/app_theme.dart';
import 'package:soapah/utils/size_utils.dart';

extension on TextStyle {
  TextStyle get lato {
    return copyWith(fontFamily: 'Lato');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }

  TextStyle get montserrat {
    return copyWith(fontFamily: 'Montserrat');
  }

  TextStyle get sFProText {
    return copyWith(fontFamily: 'SF Pro Text');
  }
}

class CustomTextStyles {
  static get bodyLargeSFProText => theme.textTheme.bodyLarge?.sFProText;

  static TextStyle get bodyMediumInterBlack900 =>
      theme.textTheme.bodyMedium!.inter.copyWith(color: appTheme.black900);

  static TextStyle get bodyMediumInterOnPrimaryContainer => theme
      .textTheme
      .bodyMedium!
      .inter
      .copyWith(color: theme.colorScheme.onPrimaryContainer);
  static TextStyle get bodyMediumMontserratBlack900 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(color: appTheme.black900);
  static TextStyle get bodyMediumMontserratBlack900_1 =>
      theme.textTheme.bodyMedium!.montserrat.copyWith(color: appTheme.black900);
  static TextStyle get bodySmall8 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.sp);
  static TextStyle get bodySmall8_1 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.sp);

  static TextStyle get bodySmall8_2 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.sp);
  static TextStyle get bodySmall8_3 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.sp);
  static TextStyle get bodySmall8_4 =>
      theme.textTheme.bodySmall!.copyWith(fontSize: 8.sp);
  static get bodySmallInter => theme.textTheme.bodySmall!.inter;
  static TextStyle get bodySmallSFProTextGray700 => theme
      .textTheme
      .bodySmall!
      .sFProText
      .copyWith(color: appTheme.gray700, fontSize: 8.sp);
  static TextStyle get bodySmallSFProTextGray700_1 =>
      theme.textTheme.bodySmall!.sFProText.copyWith(color: appTheme.gray700);

  // Headline text style
  static TextStyle get headlineMediumBlack =>
      theme.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w900);
  // Inter text style
  static TextStyle get interOnPrimary =>
      TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 3.sp,
        fontWeight: FontWeight.w400,
      ).inter;
  // Label text style
  static TextStyle get labelLarge12 =>
      theme.textTheme.labelLarge!.copyWith(fontSize: 12.sp);
  static TextStyle get labelLargeBluegray100 =>
      theme.textTheme.labelLarge!.copyWith(color: appTheme.blueGray100);
  static TextStyle get labelLargeBluegray10012 => theme.textTheme.labelLarge!
      .copyWith(color: appTheme.blueGray100, fontSize: 12.sp);
  static TextStyle get labelLargeMontserrat => theme
      .textTheme
      .labelLarge!
      .montserrat
      .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);

  static TextStyle get labelMedium10 =>
      theme.textTheme.labelMedium!.copyWith(fontSize: 10.sp);
  static TextStyle get labelMediumMontserrat => theme
      .textTheme
      .labelMedium!
      .montserrat
      .copyWith(fontWeight: FontWeight.w600);
  static TextStyle get labelMediumSFProText => theme
      .textTheme
      .labelMedium!
      .sFProText
      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500);
  static TextStyle get labelMediumSFProTextMedium => theme
      .textTheme
      .labelMedium!
      .sFProText
      .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500);
  static TextStyle get labelSmallBold =>
      theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get labelSmallBold9 => theme.textTheme.labelSmall!.copyWith(
    fontSize: 9.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle get labelSmallLatoBluegray100 =>
      theme.textTheme.labelSmall!.lato.copyWith(
        color: appTheme.blueGray100,
        fontSize: 9.sp,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelSmallMedium =>
      theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get labelSmallMedium_1 =>
      theme.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get labelSmallOnPrimaryContainer =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelSmallOnPrimaryContainerBold =>
      theme.textTheme.labelSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );

  // Montserrat text style
  static TextStyle get montserratWhite900Bold =>
      TextStyle(
        color: appTheme.white900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratWhite900LargeBold =>
      TextStyle(
        color: appTheme.white900,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratWhite800LargeBold =>
      TextStyle(
        color: appTheme.white900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratPrimary900LargeBold =>
      TextStyle(
        color: appTheme.gray600,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratPrimary800LargeBold =>
      TextStyle(
        color: appTheme.gray600,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratLarge800 =>
      TextStyle(color: appTheme.black900, fontSize: 24.sp).montserrat;
  static TextStyle get montserratBlackLarge900 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 30.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlackLarge800 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlack900Bold =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlack800Bold =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 9.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlack900Bold5 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlack900Bold5_1 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratBlack900Bold7 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 17.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;

  static TextStyle get montserratBlack900Medium =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static TextStyle get montserratBlack900Medium4 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static TextStyle get montserratBlack900Medium6 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static TextStyle get montserratBlack900Medium7 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ).montserrat;
  static TextStyle get montserratBlack900Regular =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 17.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static TextStyle get montserratBlack900Regular5 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static TextStyle get montserratBlack900Regular6 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;

  static TextStyle get montserratBlack900Regular6_1 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static TextStyle get montserratBlack900Regular6_2 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static TextStyle get montserratBlack900Regular6_3 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold4 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold5 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold5_1 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;

  static TextStyle get montserratBlack900SemiBold6 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold6_1 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold7 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratBlack900SemiBold7_1 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
      ).montserrat;
  static TextStyle get montserratSmallBlack900 =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 9.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;
  static TextStyle get montserratSmallWhite900 =>
      TextStyle(
        color: appTheme.white900,
        fontSize: 9.sp,
        fontWeight: FontWeight.w700,
      ).montserrat;

  // SF Pro text style
  static TextStyle get sFProTextGray700 =>
      TextStyle(
        color: appTheme.gray700,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ).sFProText;
  static TextStyle get sFProTextGray700Regular =>
      TextStyle(
        color: appTheme.gray700,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ).sFProText;
  static TextStyle get sFProBlackSmall =>
      TextStyle(
        color: appTheme.black900,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
      ).sFProText;
  // Title text style
  static TextStyle get titleMediumBold =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w700);
  static TextStyle get titleMediumBold18 => theme.textTheme.titleMedium!
      .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static TextStyle get titleMediumGray600 => theme.textTheme.titleMedium!
      .copyWith(color: appTheme.gray600, fontWeight: FontWeight.w700);
  static TextStyle get titleMediumMedium =>
      theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumOnPrimaryContainerBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleMediumPrimary => theme.textTheme.titleMedium!
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w500);
  static TextStyle get titleMediumPrimaryBold => theme.textTheme.titleMedium!
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w700);
  static TextStyle get titleMediumSFProText =>
      theme.textTheme.titleMedium!.sFProText.copyWith(fontSize: 18.sp);
  static TextStyle get titleMediumSFProTextMedium => theme
      .textTheme
      .titleMedium!
      .sFProText
      .copyWith(fontWeight: FontWeight.w500);
  static TextStyle get titleMediumSFProTextOnPrimaryContainer =>
      theme.textTheme.titleMedium!.sFProText.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleSmallInterPrimary => theme
      .textTheme
      .titleSmall!
      .inter
      .copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600);
  static TextStyle get titleSmallMedium =>
      theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w500);
  static TextStyle get titleSmallOnPrimaryContainer => theme
      .textTheme
      .titleSmall!
      .copyWith(color: theme.colorScheme.onPrimaryContainer);
  static TextStyle get titleSmallOnPrimaryContainer_1 => theme
      .textTheme
      .titleSmall!
      .copyWith(color: theme.colorScheme.onPrimaryContainer);
  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.primary);
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 16.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 14.sp,
      fontFamily: 'SF Pro Text',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: appTheme.black900,
      fontSize: 12.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      color: appTheme.black900,
      fontSize: 34.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w300,
      color: appTheme.black900,
    ),
    headlineSmall: TextStyle(
      color: appTheme.black900,
      fontSize: 24.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: appTheme.black900,
      fontSize: 13.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 11.sp,
      fontFamily: 'Lato',
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      color: appTheme.black900,
      fontSize: 8.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: colorScheme.onPrimaryContainer,
      fontSize: 22.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: appTheme.black900,
      fontSize: 16.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      color: appTheme.black900,
      fontSize: 14.sp,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
  );
}
