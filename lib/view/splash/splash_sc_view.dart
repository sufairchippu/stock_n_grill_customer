import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_n_grill_customer/controller/splash_sc_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';
import 'package:stock_n_grill_customer/view/Login%20Screen/login_screen.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/bottom_navbar_sc_view.dart';

class SplashScView extends StatefulWidget {
  const SplashScView({super.key});

  @override
  State<SplashScView> createState() => _SplashScViewState();
}

class _SplashScViewState extends State<SplashScView> {
  @override
  void initState() {
    Timer(Duration(seconds: 0), () {
      Future.microtask(() => context.read<SplashScController>().changeSize());
    });
    Timer(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool isloggedin = prefs.getBool("isLogged") ?? false;
      if (isloggedin == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavbarScView(),
            //RegisterScreenView()
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
            //RegisterScreenView()
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorConstant.PRIMARYCOLOR),
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
                  color: ColorConstant.SECONDARYCOLOR,
                ),
              ),
              SizedBox(width: 3),
              Icon(
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
                        duration: Duration(seconds: 3),
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
                          color: ColorConstant.SECONDARYCOLOR,
                        ),
                      ), //make widfet for logo
                    ],
                  ),
                ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
