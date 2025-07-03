import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/DUMMY/dummyy.dart';
import 'package:stock_n_grill_customer/controller/provider/navbar/home/home_screen_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import '../../../shared/frames/custom_frame_to_all.dart';
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

    return Scaffold(
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(height: 40.rh(context)),
          Padding(
            padding: EdgeInsets.all(28.rh(context)),
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
          CustomFrameToAll(
            containerColor: AppColor.kPRIMARYCOLOR,
            padding: false,
            child: Column(
              children: [
                SizedBox(height: 12.rh(context)),
                Row(
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
                              currentIndex == index
                                  ? AppColor.kThirdColor
                                  : AppColor.kPRIMARYCOLOR,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.rf(context)),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 69.rh(context),
                              width: 50.rw(context),
                              decoration: BoxDecoration(
                                color: AppColor.kScaffoldColor,
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
                                  color: AppColor.kTextColor,
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
                CustomFrameToAll(
                  padding: true,
                  child: Column(
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
                            final iteam = data[currentIndex].iteams[index];
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class _CategorySelectorMethode2 extends StatelessWidget {
//   final List<String> categories;

//   const _CategorySelectorMethode2({required this.categories});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 1.4, color: AppColor.PRIMARYCOLOR),
//         borderRadius: BorderRadius.circular(8),
//         color: AppColor.SECONDARYCOLOR4,
//       ),
//       height: 35,
//       child: Center(
//         child: SizedBox(
//           height: 50,
//           child: Consumer<HomeScreenController>(
//             builder: (context, homeScreenState, child) {
//               return ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 separatorBuilder: (context, index) => const SizedBox(width: 10),
//                 itemBuilder: (context, index) {
//                   final isSelected = homeScreenState.currentIndex == index;
//                   return InkWell(
//                     onTap: () {
//                       context.read<HomeScreenController>().onCategerieSelection(
//                         seletedIndex: index,
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                         left: 9,
//                         top: 3,
//                         bottom: 3,
//                       ),
//                       child: Container(
//                         width: 90,
//                         height: 15,
//                         decoration: BoxDecoration(
//                           color:
//                               isSelected
//                                   ? AppColor.PRIMARYCOLOR
//                                   : AppColor.SECONDARYCOLOR4,
//                           border: Border.all(width: 1.4),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Center(
//                           child: Text(
//                             categories[index],
//                             style: TextStyle(
//                               color:
//                                   isSelected
//                                       ? AppColor.SECONDARYCOLOR4
//                                       : AppColor.PRIMARYCOLOR,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
