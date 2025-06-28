import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';

class AppbarLogoWidget extends StatelessWidget {
  const AppbarLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageConstant.PRIMARYLOGO, height: 80),
        Text("Stok 'n Grill",style: GoogleFonts.aclonica(),)
      ],
    );
  }
}