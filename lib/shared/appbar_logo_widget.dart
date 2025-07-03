import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';

class AppbarLogoWidget extends StatelessWidget {
  const AppbarLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImageConstant.PRIMARYLOGO, height: 100),
        UiUtilis.textWidget(
          titile: "Stok 'n Grill",
          context: context,
          styleType: TextStyleType.mainHeading,color: AppColor.kTextColor
        ),
      ],
    );
  }
}
