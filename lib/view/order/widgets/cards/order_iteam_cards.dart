import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/utilities/validator.dart';

import '../../../../core/const/color_constant.dart';
import '../../../../core/routes/app_route_names.dart';
import '../../../../core/theme/font_const.dart';
import '../../../../core/utilities/custom_canvas/ui_utilis.dart';

//* active order
class OrderIteamActiveCard extends StatelessWidget {
  const OrderIteamActiveCard({
    super.key,
    required this.name,
    this.time,
    required this.price,
    this.quandity,
    this.image,
  });
  final String name;
  final DateTime? time;
  final double? price;
  final int? quandity;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.rh(context)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.rf(context)),
            child: Image.network(
              image ??
                  "https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg", //   iteam.image,     image,

              height: 85.rh(context),
              width: 60.rw(context),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.rw(context)),
          Expanded(
            child: Column(
              spacing: 2.rh(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiUtilis.textWidget(titile: name, context: context),
                UiUtilis.textWidget(
                  titile: Validator.formatCustomDate(time!),
                  context: context,
                  styleType: TextStyleType.caption,
                ),
                InkResponse(
                  onTap: () {
                    context.pushNamed(AppRouteNames.ordercancel);
                  },
                  child: Container(
                    height: 25.rh(context),
                    width: 100.rw(context),
                    decoration: BoxDecoration(
                      color: AppColor.kPRIMARYCOLOR,

                      borderRadius: BorderRadius.circular(30.rf(context)),
                    ),
                    child: Center(
                      child: UiUtilis.textWidget(
                        titile: 'Cancel Order',
                        fw: FontWeight.w100,
                        fz: 10.rf(context),
                        context: context,
                        color: AppColor.kThirdColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            spacing: 2.rh(context),

            children: [
              UiUtilis.textWidget(titile: "\$$price", context: context),
              UiUtilis.textWidget(titile: "$quandity iteam", context: context),
              Container(
                height: 25.rh(context),
                width: 100.rw(context),
                decoration: BoxDecoration(
                  color: AppColor.kPRIMARYCOLOR.withOpacity(.4),

                  borderRadius: BorderRadius.circular(30.rf(context)),
                ),
                child: Center(
                  child: UiUtilis.textWidget(
                    titile: 'Track Driver ',
                    fw: FontWeight.w100,
                    fz: 10.rf(context),
                    context: context,
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//*  commpleted order
class OrderIteamCompletedCard extends StatelessWidget {
  const OrderIteamCompletedCard({
    super.key,
    required this.name,
    this.time,
    required this.price,
    this.quandity,
    this.image,
  });
  final String name;
  final DateTime? time;
  final double? price;
  final int? quandity;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.rh(context)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.rf(context)),
            child: Image.network(
              image ??
                  " https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Ice_Cream_dessert_02.jpg/960px-Ice_Cream_dessert_02.jpg", //   iteam.image,     image,

              height: 85.rh(context),
              width: 60.rw(context),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.rw(context)),
          Expanded(
            child: Column(
              spacing: 2.rh(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiUtilis.textWidget(titile: name, context: context),
                UiUtilis.textWidget(
                  titile: Validator.formatCustomDate(time!),

                  context: context,
                  styleType: TextStyleType.caption,
                ),
                Row(
                  spacing: 4.rw(context),
                  children: [
                    Icon(CupertinoIcons.check_mark_circled),
                    UiUtilis.textWidget(
                      titile: 'Order Delivered',
                      context: context,
                      styleType: TextStyleType.caption,
                      color: AppColor.kPRIMARYCOLOR,
                    ),
                  ],
                ),
                InkResponse(
                  onTap: () {
                    context.pushNamed(AppRouteNames.review);
                  },
                  child: Container(
                    height: 25.rh(context),
                    width: 100.rw(context),
                    decoration: BoxDecoration(
                      color: AppColor.kPRIMARYCOLOR,

                      borderRadius: BorderRadius.circular(30.rf(context)),
                    ),
                    child: Center(
                      child: UiUtilis.textWidget(
                        titile: 'Leave a review',
                        fw: FontWeight.w100,
                        fz: 10.rf(context),
                        context: context,
                        color: AppColor.kThirdColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            spacing: 2.rh(context),

            children: [
              UiUtilis.textWidget(titile: "\$$price", context: context),
              UiUtilis.textWidget(titile: "$quandity iteam", context: context),
              Container(
                height: 25.rh(context),
                width: 100.rw(context),
                decoration: BoxDecoration(
                  color: AppColor.kPRIMARYCOLOR.withOpacity(.4),

                  borderRadius: BorderRadius.circular(30.rf(context)),
                ),
                child: Center(
                  child: UiUtilis.textWidget(
                    titile: 'Track Driver ',
                    fw: FontWeight.w100,
                    fz: 10.rf(context),
                    context: context,
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//*  Cancell order
class OrderIteamCard extends StatelessWidget {
  const OrderIteamCard({
    super.key,
    required this.name,
    this.time,
    required this.price,
    this.quandity,
    this.image,
  });
  final String name;
  final DateTime? time;
  final double? price;
  final int? quandity;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.rh(context)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.rf(context)),
            child: Image.network(
              image ??
                  "cream https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Ice_Cream_dessert_02.jpg/960px-Ice_Cream_dessert_02.jpg", //   iteam.image,     image,

              height: 85.rh(context),
              width: 60.rw(context),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.rw(context)),
          Expanded(
            child: Column(
              spacing: 2.rh(context),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UiUtilis.textWidget(titile: name, context: context),
                UiUtilis.textWidget(
                  titile: Validator.formatCustomDate(time!),

                  context: context,
                  styleType: TextStyleType.caption,
                ),
                Row(
                  spacing: 4.rw(context),
                  children: [
                    Icon(CupertinoIcons.check_mark_circled),
                    UiUtilis.textWidget(
                      titile: 'Order Delivered',
                      context: context,
                      styleType: TextStyleType.caption,
                      color: AppColor.kPRIMARYCOLOR,
                    ),
                  ],
                ),
                InkResponse(
                  onTap: () {
                    context.pushNamed(AppRouteNames.ordercancel);
                  },
                  child: Container(
                    height: 25.rh(context),
                    width: 100.rw(context),
                    decoration: BoxDecoration(
                      color: AppColor.kPRIMARYCOLOR,

                      borderRadius: BorderRadius.circular(30.rf(context)),
                    ),
                    child: Center(
                      child: UiUtilis.textWidget(
                        titile: 'Leave a review',
                        fw: FontWeight.w100,
                        fz: 10.rf(context),
                        context: context,
                        color: AppColor.kThirdColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            spacing: 2.rh(context),

            children: [
              UiUtilis.textWidget(titile: "\$$price", context: context),
              UiUtilis.textWidget(titile: "$quandity iteam", context: context),
              Container(
                height: 25.rh(context),
                width: 100.rw(context),
                decoration: BoxDecoration(
                  color: AppColor.kPRIMARYCOLOR.withOpacity(.4),

                  borderRadius: BorderRadius.circular(30.rf(context)),
                ),
                child: Center(
                  child: UiUtilis.textWidget(
                    titile: 'Track Driver ',
                    fw: FontWeight.w100,
                    fz: 10.rf(context),
                    context: context,
                    color: AppColor.kPRIMARYCOLOR,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
