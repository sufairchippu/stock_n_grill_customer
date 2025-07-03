import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/bottom_navbarsc_controller.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_painted/main_frame_app.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/home/home_screen.dart';

class BottomNavbarScView extends StatefulWidget {
  const BottomNavbarScView({super.key});

  @override
  State<BottomNavbarScView> createState() => _BottomNavbarScViewState();
}

class _BottomNavbarScViewState extends State<BottomNavbarScView> {
  List bottomScreens = [
    const HomeScreen(),
    Container(color: AppColor.kPRIMARYCOLOR),

    const MainFrameApp(customPaintChild: Column()),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavbarscController>(
      builder:
          (context, state, child) => Scaffold(
            // appBar: AppBar(
            //   backgroundColor: AppColor.PRIMARYCOLOR,
            //   title: AppbarLogoWidget(),
            //   centerTitle: true,
            //   // leading: IconButton(
            //   //   icon: Icon(
            //   //     Icons.menu,
            //   //     color: ColorConstant.SECONDARYCOLOR3,
            //   //   ), // Your Custom Icon
            //   //   onPressed: () {
            //   //     Scaffold.of(context).openDrawer(); // To Open Drawer
            //   //   },
            //   // ),
            // ),
            body: bottomScreens[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColor.kPRIMARYCOLOR,
              selectedItemColor: AppColor.kSECONDARYCOLOR3,
              unselectedItemColor: AppColor.kScaffoldColor,
              elevation: 10,

              currentIndex: state.currentIndex,
              onTap: (value) {
                state.onScreenChange(seletedIndex: value);
              },
              items: const [
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
            endDrawer: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70.rf(context)),
                  bottomLeft: Radius.circular(70.rf(context)),
                ),
              ),
              backgroundColor: AppColor.kSECONDARYCOLOR3,
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
                      const SizedBox(height: 24),
                      CircleAvatar(
                        radius: 30,
                        child: Text(
                          "N",
                          style: GoogleFonts.aclonica(fontSize: 30),
                        ),
                      ), //names first letter
                      const SizedBox(width: 10),
                      Text(
                        "Name" ?? "User Not Registerd",
                        style: GoogleFonts.aclonica(fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      _buildDrawer_methods(
                        onTapp: () {},
                        title: "About Us",
                        icon: Icons.info_outlined,
                      ),
                      const SizedBox(height: 20),
                      _buildDrawer_methods(
                        onTapp: () {},
                        title: "Conduct Us",
                        icon: Icons.person_pin_outlined,
                      ),
                      const SizedBox(height: 30),

                      _buildDrawer_methods(
                        onTapp: () {},
                        title: "Settings",
                        icon: Icons.settings_rounded,
                      ),
                      const Spacer(),
                      _buildDrawer_methods(
                        onTapp: () async {
                          await LocalStorage.clearall(); // Clear all stored data
                          await LocalStorage.setBool("isLogged", false);
                          context.push('/login');
                        },
                        title: "Log Out",
                        icon: Icons.logout,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  InkWell _buildDrawer_methods({
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