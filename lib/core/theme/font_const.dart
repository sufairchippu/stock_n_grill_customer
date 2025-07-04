import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

enum TextStyleType {
  mainHeading,
  headline0,
  headline1,
  headline2,
  subtitle1,
  subtitle2,
  subtitle3,
  bodyText1,
  bodyText2,
  caption,
  overline,
  button,
  label,
  errorText,
  subtitleHeading,
}

class AppTextStyles {
  static TextStyle getStyle(
    BuildContext context,
    TextStyleType type, {
    Color? color,
    FontWeight? weight,
    double? fontSize,
  }) {
    final defaultColor = color ?? AppColor.kSECONDARYCOLOR3;

    switch (type) {
      case TextStyleType.headline0:
        return GoogleFonts.aclonica(
          fontWeight: weight ?? FontWeight.w700,
          fontSize: fontSize ?? 20.rf(context),
          color: defaultColor,
        );
      case TextStyleType.mainHeading:
        return GoogleFonts.aclonica(
          fontWeight: weight ?? FontWeight.w700,
          fontSize: fontSize ?? 20.rf(context),
          color: defaultColor,
        );
      case TextStyleType.headline1:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w700,
          fontSize: fontSize ?? 24.rf(context),
          color: defaultColor,
        );
      case TextStyleType.headline2:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w600,
          fontSize: fontSize ?? 20.rf(context),
          color: defaultColor,
        );
      case TextStyleType.subtitle1:
        return GoogleFonts.poppins(
          fontWeight: weight ?? FontWeight.w600,
          fontSize: fontSize ?? 16.rf(context),
          color: defaultColor,
        );
      case TextStyleType.subtitle2:
        return GoogleFonts.leagueSpartan(
          fontWeight: weight ?? FontWeight.w500,
          fontSize: fontSize ?? 12.rf(context),
          color: defaultColor,
        );
      case TextStyleType.subtitle3:
        return GoogleFonts.poppins(
          fontWeight: weight ?? FontWeight.w600,
          fontSize: fontSize ?? 16.rf(context),
          color: AppColor.kThirdColor,
        );
      case TextStyleType.bodyText1:
        return GoogleFonts.aclonica(
          fontWeight: weight ?? FontWeight.w400,
          fontSize: fontSize ?? 12.rf(context),
          color: defaultColor,
        );
      case TextStyleType.bodyText2:
        return GoogleFonts.aclonica(
          fontWeight: weight ?? FontWeight.w400,
          fontSize: fontSize ?? 20.rf(context),
          color: defaultColor,
        );
      case TextStyleType.caption:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w300,
          fontSize: fontSize ?? 11.rf(context),
          color: defaultColor,
        );
      case TextStyleType.overline:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w300,
          fontSize: fontSize ?? 10.rf(context),
          color: defaultColor,
        );
      case TextStyleType.button:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w600,
          fontSize: fontSize ?? 14.rf(context),
          color: defaultColor,
        );
      case TextStyleType.label:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w500,
          fontSize: fontSize ?? 13.rf(context),
          color: defaultColor,
        );
      case TextStyleType.errorText:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w400,
          fontSize: fontSize ?? 12.rf(context),
          color: AppColor.kRedColor,
        );
      //* common use
      case TextStyleType.subtitleHeading:
        return TextStyle(
          fontWeight: weight ?? FontWeight.w600,
          fontSize: fontSize ?? 13.rf(context),
          color: defaultColor,
        );
    }
  }
}
