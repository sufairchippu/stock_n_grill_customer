import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stock_n_grill_customer/controller/bottom_navbarsc_controller.dart';
import 'package:stock_n_grill_customer/services/global%20widget/appbar_logo_widget.dart';
import 'package:stock_n_grill_customer/services/utilities/color_constant.dart';
import 'package:stock_n_grill_customer/services/utilities/image_constant.dart';
import 'package:stock_n_grill_customer/view/Login%20Screen/login_screen.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/home/home_screen.dart';

class BottomNavbarScView extends StatefulWidget {
  const BottomNavbarScView({super.key});

  @override
  State<BottomNavbarScView> createState() => _BottomNavbarScViewState();
}

class _BottomNavbarScViewState extends State<BottomNavbarScView> {
  List bottomScreens = [
    HomeScreen(),
    Container(color: ColorConstant.PRIMARYCOLOR),

    Container(color: ColorConstant.PRIMARYCOLOR),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarscController>(
      builder:
          (context, state, child) => Scaffold(
            appBar: AppBar(

              
              backgroundColor: ColorConstant.PRIMARYCOLOR,
              title: AppbarLogoWidget(),
              centerTitle: true,
              // leading: IconButton(
              //   icon: Icon(
              //     Icons.menu,
              //     color: ColorConstant.SECONDARYCOLOR3,
              //   ), // Your Custom Icon
              //   onPressed: () {
              //     Scaffold.of(context).openDrawer(); // To Open Drawer
              //   },
              // ),
            ),

            body: bottomScreens[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorConstant.PRIMARYCOLOR,
              selectedItemColor: ColorConstant.SECONDARYCOLOR3,
              unselectedItemColor: ColorConstant.SECONDARYCOLOR2,
              elevation: 10,

              currentIndex: state.currentIndex,
              onTap: (value) {
                state.onScreenChange(seletedIndex: value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer_sharp),
                  label: "Ordered Items",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood_outlined),
                  label: "Cart",
                ),
              ],
            ),
            drawer: Drawer(
              backgroundColor: ColorConstant.SECONDARYCOLOR3,
              clipBehavior: Clip.antiAlias,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(ImageConstant.PRIMARYLOGO, height: 90),
                          Text(
                            "Stok 'n grill",
                            style: GoogleFonts.aclonica(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      CircleAvatar(
                        radius: 30,
                        child: Text(
                          "N",
                          style: GoogleFonts.aclonica(fontSize: 30),
                        ),
                      ), //names first letter
                      SizedBox(width: 10),
                      Text(
                        "Name" ?? "User Not Registerd",
                        style: GoogleFonts.aclonica(fontSize: 20),
                      ),
                      SizedBox(height: 30),
                      _BuildDrawer_methods(
                        onTapp: () {},
                        title: "About Us",
                        icon: Icons.info_outlined,
                      ),
                      SizedBox(height: 20),
                      _BuildDrawer_methods(onTapp: () {
                        
                      },
                        title: "Conduct Us",
                        icon: Icons.person_pin_outlined,
                      ),
                      SizedBox(height: 30),

                      _BuildDrawer_methods(
                        onTapp: () {},
                        title: "Settings",
                        icon: Icons.settings_rounded,
                      ),
                      Spacer(),
                      _BuildDrawer_methods(
                        onTapp: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.clear(); // Clear all stored data
                          await prefs.setBool("isLogged", false);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        title: "Log Out",
                        icon: Icons.logout,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  InkWell _BuildDrawer_methods({
    required String title,
    required IconData icon,
    void Function()? onTapp,
  }) {
    final Title = title;
    final Icon1 = icon;
    final onTap = onTapp;
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Title, style: GoogleFonts.aclonica(fontSize: 14)),
          Icon(Icon1),
        ],
      ),
    );
  }
}


// Icons.settings_rounded