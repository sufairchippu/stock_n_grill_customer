import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/DUMMY/dummyy.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/home/home_screen_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/home/widgets/og_home_screen.dart';
import '../../../shared/frames/custom_frame_to_all.dart';
import '../../iteam_screen/iteam_screen.dart';
import 'widgets/iteam_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final TextEditingController searchCntrlr = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  final data = Dummy.categories;
  // final provider=Provider.of<>(context)
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<HomeScreenController>().currentIndex;
    final category = context.watch<HomeScreenController>().isCategory;

    return Scaffold(
      // drawer: const Drawer(child: ,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.rh(context)),
          Padding(
            padding: EdgeInsets.only(
              left: 28.rh(context),
              right: 28.rh(context),
              top: 28.rh(context),
              bottom: 12.rh(context),
            ),
            child: Row(
              spacing: 12.rw(context),
              children: [
                /*InputFieldWidget(
                  inputController: searchCntrlr,
                  width: 200.rw(context),
                  hintText: 'Search',
                  height: 25,
                  suffix: CircleAvatar(
                    backgroundColor: AppColor.kPRIMARYCOLOR,
                    radius: 20.rf(context),
                    child: UiUtilis.getSvg(
                      path: 'assets/svg/filter.svg',
                      color: AppColor.kScaffoldColor,
                    ),
                  ),
                )*/
                const Spacer(),
                CircleAvatar(
                  radius: 13.rf(context),
                  backgroundColor: AppColor.kThirdColor,
                  child: UiUtilis.getSvg(
                    path: SvgConstants.shop,
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
                CircleAvatar(
                  radius: 13.rf(context),
                  backgroundColor: AppColor.kThirdColor,
                  child: UiUtilis.getSvg(
                    path: SvgConstants.notification,
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    return Scaffold.of(context).openEndDrawer();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.kThirdColor,
                    radius: 13.rf(context),
                    child: UiUtilis.getSvg(
                      path: SvgConstants.profile,
                      color: AppColor.kPRIMARYCOLOR,
                    ),
                  ),
                ),
              ],
            ),
          ),
          category
              ? SizedBox()
              : Padding(
                padding: EdgeInsets.fromLTRB(
                  18.rw(context),
                  0,
                  18.rw(context),
                  2.rh(context),
                ),

                child: Column(
                  spacing: 2.rh(context),

                  children: [
                    UiUtilis.textWidget(
                      titile: "Good Morning",
                      context: context,
                      styleType: TextStyleType.subtitleHeading,
                    ),

                    UiUtilis.textWidget(
                      titile: "Rise and shine! It's breakfast time",
                      context: context,
                      styleType: TextStyleType.button,
                    ),
                  ],
                ),
              ),

          CustomFrameToAll(
            containerColor:
                category ? AppColor.kPRIMARYCOLOR : AppColor.kThirdColor,
            padding: false,
            child: Column(
              children: [
                SizedBox(height: 12.rh(context)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.rw(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.length,
                        (index) => InkResponse(
                          onTap: () {
                            context
                                .read<HomeScreenController>()
                                .onCategerieSelection(seletedIndex: index);
                          },

                          /// do the function for change index
                          child: Container(
                            width: 80.rw(context),
                            height: 90.rh(context),
                            decoration: BoxDecoration(
                              color:
                                  category
                                      ? currentIndex == index
                                          ? AppColor.kThirdColor
                                          : AppColor.kPRIMARYCOLOR
                                      : AppColor.kThirdColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.rf(context)),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 64.rh(context),
                                  width: 59.rw(context),
                                  decoration: BoxDecoration(
                                    color: AppColor.kScaffoldColor.withOpacity(
                                      .6,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      30.rf(context),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.rf(context)),
                                    child: UiUtilis.getSvg(
                                      fit: BoxFit.scaleDown,
                                      height: 18.rh(context),
                                      width: 15.rw(context),
                                      path: data[index].image,
                                      color: AppColor.kPRIMARYCOLOR,
                                    ),
                                  ),
                                ),
                                UiUtilis.textWidget(
                                  titile: data[index].titile,
                                  context: context,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, 1),
                      painter: DottedLinePainter(),
                    );
                  },
                ),
                CustomFrameToAll(
                  padding: true,
                  child:
                      category
                          ? Column(
                            children: [
                              Row(
                                spacing: 8.rf(context),
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UiUtilis.textWidget(
                                    titile: 'Sort By',
                                    context: context,
                                    color: AppColor.kTextColor,
                                  ),
                                  UiUtilis.textWidget(
                                    titile: 'Popular',
                                    context: context,
                                    color: AppColor.kPRIMARYCOLOR,
                                  ),
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor: AppColor.kTextColor,
                                    radius: 20.rf(context),
                                    child: UiUtilis.getSvg(
                                      path: 'assets/svg/filter.svg',
                                      color: AppColor.kPRIMARYCOLOR,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.rf(context)),
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: data[currentIndex].iteams.length,
                                  itemBuilder: (context, index) {
                                    final iteam =
                                        data[currentIndex].iteams[index];
                                    return IteamWidget(
                                      titile: iteam.titile,
                                      rating: iteam.rating,
                                      fav: iteam.fav,
                                      image: iteam.image,
                                      price: iteam.price,
                                      discrption: iteam.discrption,
                                      category: iteam.category,
                                      ontap: () {
                                        context.push('/iteam', extra: iteam);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          )
                          : OgHomeScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
