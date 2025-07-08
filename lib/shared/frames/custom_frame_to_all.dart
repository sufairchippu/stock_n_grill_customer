import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import '../../core/const/color_constant.dart';

class CustomFrameToAll extends StatelessWidget {
  const CustomFrameToAll({
    super.key,
    required this.child,
    this.containerColor,
    this.padding = true,
  });

  final Widget child;
  final Color? containerColor;
  final bool? padding;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding:
            padding!
                ? EdgeInsets.fromLTRB(
                  40.rw(context),
                  20.rh(context),
                  40.rw(context),
                  0,
                )
                : null,
        decoration: BoxDecoration(
          color: containerColor ?? AppColor.kThirdColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30.rf(context)),
          ),
        ),
        child: child,
      ),
    );
  }
}
