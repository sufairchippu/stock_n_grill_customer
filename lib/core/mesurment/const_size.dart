
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

class ConstMesurments {
  final BuildContext context;
  ConstMesurments(this.context);
  double get verticalPadding => 10.rh(context);
  double get horizontalPadding => 10.rw(context);
  double get verticalMargin => 10.rh(context);
  double get horizontalMargin => 10.rw(context);
  double get borderRadious => 8.rf(context);
  double get verticalPadding20 => 20.rh(context);
  double get horizontalPadding24 => 24.rw(context);
}
