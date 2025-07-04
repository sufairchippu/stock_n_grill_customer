import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/bottom_navbarsc_controller.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/model/data/category_model.dart';

import 'package:stock_n_grill_customer/shared/frames/custom_painted/main_frame_app.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/home/home_screen.dart';
import 'package:stock_n_grill_customer/view/order/my_order_screen.dart';

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
    final List<DrawerItem> items = [
      DrawerItem(SvgConstants.shop, () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyOrderScreen()),
        );
      }, 'My Order'),
      DrawerItem(SvgConstants.shop, () {}, 'My Profile'),
      DrawerItem(SvgConstants.shop, () {}, 'Delivery Address'),
      DrawerItem(SvgConstants.shop, () {}, 'Pyment Methode'),
      DrawerItem(SvgConstants.shop, () {}, 'Contact Us'),
      DrawerItem(SvgConstants.shop, () {}, 'Help & FAQ\'s'),
      DrawerItem(SvgConstants.shop, () {}, 'Settings'),
    ];
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
                side: BorderSide(width: double.infinity),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60.rf(context)),
                  bottomLeft: Radius.circular(60.rf(context)),
                ),
              ),
              backgroundColor: AppColor.kPRIMARYCOLOR,
              clipBehavior: Clip.antiAlias,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.rw(context),
                    right: 10.rw(context),
                  ),
                  child: buildMainDrawer(items),
                ),
              ),
            ),
          ),
    );
  }

  //* main app  drawer for
  Widget buildMainDrawer(List<DrawerItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 10.rw(context),
          children: [
            CircleAvatar(
              radius: 20.rf(
                context,
              ), //if user is true than user photo or user first letter
              child: UiUtilis.getSvg(
                path: SvgConstants.profile2,
                height: 25.rh(context),
                width: 25.rw(context),
              ),
            ),
            UiUtilis.textWidget(
              context: context,
              titile: "User-name",
              styleType: TextStyleType.bodyText2,
              //style: GoogleFonts.aclonica(fontSize: 18),
            ),
          ],
        ),
        SizedBox(height: 30.rf(context)),

        //names first letter
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: items[index].nav,
              child: Row(
                spacing: 20.rw(context),
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40.rh(context),
                    width: 40.rw(context),
                    decoration: BoxDecoration(
                      color: AppColor.kThirdColor,
                      borderRadius: BorderRadius.circular(12.rf(context)),
                    ),
                    child: UiUtilis.getSvg(
                      fit: BoxFit.none,
                      height: 40.rh(context),
                      width: 40.rw(context),
                      path: items[index].icon,
                    ),
                  ),
                  UiUtilis.textWidget(
                    titile: items[index].titile,
                    context: context,
                    styleType: TextStyleType.subtitle3,
                  ),
                ],
              ),
            );
          },
          separatorBuilder:
              (context, index) => Divider(thickness: 1.rh(context)),
          itemCount: items.length,
        ),
        Divider(),
        SizedBox(height: 12.rh(context)),

        InkWell(
          onTap: () {},
          child: Row(
            spacing: 20.rw(context),
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40.rh(context),
                width: 40.rw(context),
                decoration: BoxDecoration(
                  color: AppColor.kThirdColor,
                  borderRadius: BorderRadius.circular(12.rf(context)),
                ),
                child: UiUtilis.getSvg(
                  path: SvgConstants.star,
                  fit: BoxFit.none,
                  height: 40.rh(context),
                  width: 40.rw(context),
                ),
              ),
              UiUtilis.textWidget(
                titile: 'Log Out',
                context: context,
                styleType: TextStyleType.subtitle3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// Icons.settings_rounded