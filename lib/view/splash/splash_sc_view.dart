import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/splash/splash_sc_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';

class SplashScView extends StatefulWidget {
  const SplashScView({super.key});

  @override
  State<SplashScView> createState() => _SplashScViewState();
}

class _SplashScViewState extends State<SplashScView> {
  final bool isloggedin = LocalStorage.getBool('isLogged');
  @override
  void initState() {
    Timer(const Duration(seconds: 0), () {
      Future.microtask(() => context.read<SplashScController>().changeSize());
    });
    Timer(const Duration(milliseconds:1500 ), () async {
      if (isloggedin == true) {
        context.go('/navbar');
      } else {
        context.go('/login');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.kScaffoldColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.start,
                "deDicius foods by stock",
                style: GoogleFonts.aclonica(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: AppColor.kTextColor,
                ),
              ),
              const SizedBox(width: 3),
              const Icon(
                size: 13,
                Icons.check_circle_outline_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          Consumer<SplashScController>(
            builder:
                (context, value, child) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        // alignment:
                        //     value.isexpanded
                        //         ? Alignment(0, 10)
                        //         : Alignment(0, 0),   ###howw to do aligment from bottim to top
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: value.isexpanded ? 50 : 200,
                        width: value.isexpanded ? 50 : 200,
                        duration: const Duration(seconds: 3),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          ImageConstant.PRIMARYLOGO,
                        ),
                      ),
                      Text(
                        "Stok n' Grill",
                        style: GoogleFonts.aclonica(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: AppColor.kTextColor,
                        ),
                      ), //make widfet for logo
                    ],
                  ),
                ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
