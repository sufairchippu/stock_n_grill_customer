import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/routes/app_route_names.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_base_screen.dart';
import 'package:stock_n_grill_customer/shared/input_field_widget.dart';

import '../../../core/const/color_constant.dart';

class CancelOrderScreen extends StatefulWidget {
  const CancelOrderScreen({super.key});

  @override
  State<CancelOrderScreen> createState() => _CancelOrderScreenState();
}

class _CancelOrderScreenState extends State<CancelOrderScreen> {
  int? selctedValue;
  List options = [
    'Out Of money',
    'To exchange',
    'Order mstaken',
    'Waiting Time',
  ];
  final descriptionCntrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBaseScreen(
        title: 'Cancel Order',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.rh(context),
          children: [
            SizedBox(height: 25.rh(context)),
            UiUtilis.textWidget(
              titile:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent pellentesque congue lorem, vel tincidunt tortor.',
              context: context,
              styleType: TextStyleType.errorText,
              maxLines: 2,
            ),
            SizedBox(height: 13.rh(context)),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selctedValue = index;
                      });
                    },
                    child: Column(
                      children: [
                        Divider(color: AppColor.kPRIMARYCOLOR.withOpacity(.6)),
                        Row(
                          children: [
                            UiUtilis.textWidget(
                              titile: options[index],
                              context: context,
                              styleType: TextStyleType.headline2,
                            ),
                            Spacer(),
                            Radio(
                              value: index,
                              groupValue: selctedValue,
                              onChanged: (value) {
                                setState(() {
                                  selctedValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
            ),
            Divider(color: AppColor.kPRIMARYCOLOR.withOpacity(.6)),
            SizedBox(height: 15.rh(context)),
            UiUtilis.textWidget(
              titile: 'Others',
              context: context,
              styleType: TextStyleType.headline2,
            ),
            InputFieldWidget(
              contentPadding: 20.rf(context),
              hintText: 'Others reason...',
              inputController: descriptionCntrller,
              borderRadius: 25.rf(context),
              conntainerColor: AppColor.kScaffoldColor.withOpacity(0.6),
              maxline: 3,
              borderColor: AppColor.kScaffoldColor.withOpacity(0.6),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(AppRouteNames.cancelsplash);
                    // context.push('/navbar/order/ordercancel/cancelsplash');
                  },
                  child: Container(
                    height: 35.rh(context),
                    width: 120.rw(context),
                    decoration: BoxDecoration(
                      color: AppColor.kPRIMARYCOLOR,

                      borderRadius: BorderRadius.circular(30.rf(context)),
                    ),

                    child: Center(
                      child: UiUtilis.textWidget(
                        titile: 'Submit',
                        context: context,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.rh(context)),
            // Container(
            //   height: 90,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30.rf(context)),
            //     color: AppColor.kScaffoldColor.withOpacity(.6),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
