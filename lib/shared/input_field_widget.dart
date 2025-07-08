import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    required this.inputController,
    this.hintText,
    this.labelText,
    this.errorText,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.obscureText,
    this.prefixIcon,
    this.width,
    this.conntainerColor,
    this.borderRadius,
    this.height,
    this.suffix,
    this.maxline,
    this.borderColor,
    this.contentPadding,
  });
  final double? contentPadding;
  final TextEditingController inputController;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final double? width;
  final Color? conntainerColor;
  final double? borderRadius;
  final double? height;
  final Widget? suffix;
  final int? maxline;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: inputController,
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
      maxLines: maxline ?? 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(contentPadding ?? 1.rf(context)),
        fillColor: conntainerColor ?? AppColor.kThirdColor,
        prefixIcon: prefixIcon,
        suffix: suffix,
        errorText: errorText,
        hintText: hintText,
        labelText: labelText,

        filled: true,
        floatingLabelStyle: TextStyle(color: AppColor.kTextColor),
        labelStyle: GoogleFonts.montserrat(),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColor.kScaffoldColor,
            width: 1.rw(context),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.rf(context)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColor.kScaffoldColor,
            width: 1.0.rw(context),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.rf(context)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.rf(context)),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.kGreyColor,
            width: 2.0.rw(context),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColor.kBrownColor,
            width: 2.0.rw(context),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.rf(context)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? AppColor.kBrownColor,
            width: 2.5.rw(context),
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 10.rf(context)),
        ),
      ),
    );
  }
}
