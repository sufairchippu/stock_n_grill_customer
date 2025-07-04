import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/controller/services/provider_class/provider_class.dart';

import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/routes/app_router.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const ProviderClass(child: StockNGrillCustomer()));
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
