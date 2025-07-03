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
  });

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
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: inputController,
      keyboardType: keyboardType,
      maxLength: maxLength,
      validator: validator,
    
      decoration: InputDecoration(contentPadding: EdgeInsets.all(1.rf(context)),
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
          borderSide: BorderSide(color: AppColor.kScaffoldColor, width: 10.0),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kGreyColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kBrownColor, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.kBrownColor, width: 2.5),
        ),
      ),
    );
  }
}
