import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/services/utilities/color_constant.dart';

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
    required this.obscureText,
    this.prefixIcon,
  });

  final TextEditingController inputController;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: ColorConstant.SECONDARYCOLOR3,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        obscureText: obscureText,
        controller: inputController,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator: validator,

        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          errorText: errorText,
          hintText: hintText,
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: Colors.black),
          labelStyle: GoogleFonts.montserrat(),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorConstant.SECONDARYCOLOR2,
              width: 10.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.brown.shade900, width: 2.5),
          ),
        ),
      ),
    );
  }
}
