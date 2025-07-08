import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

import '../../core/const/color_constant.dart';
import '../../core/theme/font_const.dart';
import '../../core/utilities/custom_canvas/ui_utilis.dart';
import 'custom_frame_to_all.dart';

class CustomBaseScreen extends StatelessWidget {
  const CustomBaseScreen({
    super.key,
    required this.title,
    required this.child,
    this.basecolor,
    this.onback,
  });
  final String title;
  final Widget child;
  final Color? basecolor;
  final void Function()? onback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.rh(context)),
          Padding(
            padding: EdgeInsets.all(28.rh(context)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onback ?? context.pop,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 15.rf(context),
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
                const Spacer(),
                UiUtilis.textWidget(
                  titile: title,
                  context: context,
                  styleType: TextStyleType.subtitle3,
                ),
                const Spacer(),
              ],
            ),
          ),
          CustomFrameToAll(child: child, containerColor: basecolor),
        ],
      ),
    );
  }
}
