import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/DUMMY/dummyy.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/routes/app_route_names.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_base_screen.dart';

import '../../controller/provider/order/my_order_controller.dart';
import '../../core/const/color_constant.dart';
import 'widgets/cards/order_iteam_cards.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> status = ['Active', 'Completed', 'Cancelled'];
    final data =
        Dummy
            .dataaaaa; //create set list respectivly call it by the index to get list of iteam

    return Scaffold(
      body: CustomBaseScreen(
        title: "My Order",
        child: Consumer<MyOrderController>(
          builder:
              (context, orderstate, child) => Column(
                children: [
                  SizedBox(height: 25.rf(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(status.length, (index) {
                      return InkResponse(
                        onTap: () {
                          orderstate.changeStatus(index);
                        },
                        child: Container(
                          height: 25.rh(context),
                          width: 100.rw(context),
                          decoration: BoxDecoration(
                            color:
                                orderstate.selctedStatus == index
                                    ? AppColor.kPRIMARYCOLOR.withOpacity(.4)
                                    : AppColor.kPRIMARYCOLOR,
                            borderRadius: BorderRadius.circular(30.rf(context)),
                          ),
                          child: Center(
                            child: UiUtilis.textWidget(
                              titile: status[index],
                              fw: FontWeight.w100,
                              context: context,
                              color:
                                  orderstate.selctedStatus == index
                                      ? AppColor.kPRIMARYCOLOR
                                      : AppColor.kThirdColor,
                            ),
                          ),
                        ),
                      );
                    }), //[
                    //   Container(
                    //     height: 25.rh(context),
                    //     width: 100.rw(context),
                    //     decoration: BoxDecoration(
                    //       color: AppColor.kPRIMARYCOLOR,
                    //       borderRadius: BorderRadius.circular(30.rf(context)),
                    //     ),
                    //     child: Center(
                    //       child: UiUtilis.textWidget(
                    //         titile: "Active",
                    //         context: context,
                    //         color: AppColor.kThirdColor,
                    //       ),
                    //     ),
                    //   ),
                    //   Container(
                    //     height: 25.rh(context),
                    //     width: 100.rw(context),
                    //     decoration: BoxDecoration(
                    //       color: AppColor.kPRIMARYCOLOR,
                    //       borderRadius: BorderRadius.circular(30.rf(context)),
                    //     ),
                    //     child: Center(
                    //       child: UiUtilis.textWidget(
                    //         titile: "Completed",
                    //         context: context,
                    //         color: AppColor.kThirdColor,
                    //       ),
                    //     ),
                    //   ),

                    // ],
                  ),
                  SizedBox(height: 20.rf(context)),

                  Divider(color: AppColor.kPRIMARYCOLOR.withOpacity(.6)),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      // shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return data.isEmpty
                            ? Center(
                              child: Container(
                                color: AppColor.kBrownColor,
                                height: 20,
                                width: 100,
                              ),
                              //  Column(
                              //   children: [
                              //     UiUtilis.getSvg(
                              //       path: SvgConstants.nodata,
                              //       width: 142.rw(context),
                              //       height: 168.rh(context),
                              //     ),
                              //     UiUtilis.textWidget(
                              //       titile:
                              //           'You don\'t have any active orders at this time',
                              //       context: context,
                              //     ),
                              //   ],
                              // ),
                            )
                            : orderstate.selctedStatus == 0
                            ? OrderIteamActiveCard(
                              name: data[index].titile,
                              price: data[index].price,
                              quandity: 3,
                              time: DateTime.now(),
                              image:
                                  "https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg", //   iteam.image,     image,
                            )
                            : orderstate.selctedStatus == 1
                            ? OrderIteamCompletedCard(
                              name: data[index].titile,
                              price: data[index].price,
                              quandity: 3,
                              time: DateTime.now(),
                              image:
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Ice_Cream_dessert_02.jpg/960px-Ice_Cream_dessert_02.jpg", //   iteam.image,     image,
                            )
                            : OrderIteamCard(
                              name: data[index].titile,
                              price: data[index].price,
                              quandity: 3,
                              time: DateTime.now(),
                              image:
                                  "https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg", //   iteam.image,     image,
                            );
                      },
                      itemCount: data.length,
                      separatorBuilder:
                          (context, index) => Divider(
                            color: AppColor.kPRIMARYCOLOR.withOpacity(.6),
                          ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
