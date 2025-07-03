import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/bottom_navbarsc_controller.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/home/home_screen_controller.dart';
import 'package:stock_n_grill_customer/controller/provider/splash/splash_sc_controller.dart';

import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/routes/app_router.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => BottomNavbarscController()),
        ChangeNotifierProvider(create: (context) => SplashScController()),
      ],
      child: const StockNGrillCustomer(),
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
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.kScaffoldColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: AppColor.kSECONDARYCOLOR3),
        ),
      ),
      debugShowCheckedModeBanner: false,

      routerConfig: approute,
    );
  }
}
