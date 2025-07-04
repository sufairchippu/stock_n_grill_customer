import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/order/my_order_controller.dart';

import '../../provider/iteam/iteam_screen_controller.dart';
import '../../provider/navbar/bottom_navbarsc_controller.dart';
import '../../provider/navbar/home/home_screen_controller.dart';
import '../../provider/splash/splash_sc_controller.dart';

class ProviderClass extends StatelessWidget {
  const ProviderClass({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => BottomNavbarscController()),
        ChangeNotifierProvider(create: (context) => SplashScController()),
        ChangeNotifierProvider(create: (context) => IteamScreenController()),
        ChangeNotifierProvider(create: (context) => MyOrderController()),
      ],
      child: child,
    );
  }
}
