import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';

class UiUtilis {
  static Text textWidget({
    required String titile,
    required BuildContext context,
    TextStyleType styleType = TextStyleType.bodyText1,
    FontWeight? fw,
    double? fz,
    Color? color,
    int? maxLines,
    TextAlign? textAlign,
    TextOverflow? overflow,
  }) {
    final baseStyle = AppTextStyles.getStyle(context, styleType);
    final mergedStyle = baseStyle.copyWith(
      fontWeight: fw ?? baseStyle.fontWeight,
      fontSize: fz ?? baseStyle.fontSize,
      color: color ?? baseStyle.color,
    );
    return Text(titile, style: mergedStyle);
  }

  static SvgPicture getSvg({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }
}
