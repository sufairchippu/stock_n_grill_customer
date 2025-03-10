import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/bottom_navbarsc_controller.dart';
import 'package:stock_n_grill_customer/controller/home_screen_controller.dart';
import 'package:stock_n_grill_customer/controller/splash_sc_controller.dart';

import 'package:stock_n_grill_customer/services/utilities/color_constant.dart';
import 'package:stock_n_grill_customer/view/splash/splash_sc_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => BottomNavbarscController()),
        ChangeNotifierProvider(create: (context) => SplashScController()),
      ],
      child: StockNGrillCustomer(),
    ),
  );
}

class StockNGrillCustomer extends StatefulWidget {
  const StockNGrillCustomer({super.key});

  @override
  State<StockNGrillCustomer> createState() => _StockNGrillCustomerState();
}

class _StockNGrillCustomerState extends State<StockNGrillCustomer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConstant.PRIMARYCOLOR,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: ColorConstant.SECONDARYCOLOR3),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: SplashScView()),
    );
  }
}
