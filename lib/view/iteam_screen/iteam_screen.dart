import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/DUMMY/dummyy.dart';
import 'package:stock_n_grill_customer/controller/provider/iteam/iteam_screen_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/model/data/iteam_model.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_frame_to_all.dart';

class IteamScreen extends StatelessWidget {
  const IteamScreen({super.key, required this.iteam});
  final IteamModel iteam;
  @override
  Widget build(BuildContext context) {
    final cout = context.watch<IteamScreenController>().count;
    final dummydata = Dummy.ingredients_list;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.rh(context)),
          _buildAppBarMethode(context),
          CustomFrameToAll(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.rf(context)),
                  ),
                  child: Image.network(
                    "https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg", //   iteam.image,     image,
                    height: 260.rh(context),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.rh(context)),
                Row(
                  spacing: 12.rw(context),
                  children: [
                    UiUtilis.textWidget(
                      titile: '\$${iteam.price}',
                      fz: 18.rf(context),
                      context: context,
                    ),
                    const Spacer(),
                    InkResponse(
                      onTap: () {
                        cout <= 1
                            ? null
                            : 
                            context
                                .read<IteamScreenController>()
                                .decremntCount();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.kPRIMARYCOLOR.withOpacity(
                          0.26,
                        ),
                        child: Icon(Icons.remove, color: AppColor.kThirdColor),
                      ),
                    ),
                    UiUtilis.textWidget(
                      titile: cout.toString(),
                      fz: 18.rf(context),
                      context: context,
                    ),
                    InkResponse(
                      onTap: () {
                        context.read<IteamScreenController>().incremntCount();
                      },
                      child: CircleAvatar(
                        backgroundColor: AppColor.kPRIMARYCOLOR,
                        child: Icon(
                          Icons.add,
                          color: AppColor.kThirdColor,
                        ), //withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 2.rh(context)),
                UiUtilis.textWidget(titile: iteam.discrption, context: context),
                UiUtilis.textWidget(
                  styleType: TextStyleType.caption,
                  titile:
                      iteam.making ??
                      'Juicy, tender chicken breasts marinated in a zesty blend of lemon juice, garlic, and mixed herbs, then grilled to smoky perfection. The charred edges offer a .',
                  context: context,
                ),
                SizedBox(height: 10.rf(context)),
                const Spacer(),
                UiUtilis.textWidget(
                  titile: 'Add on ingredients',
                  styleType: TextStyleType.bodyText2,
                  context: context,
                ),
                Column(
                  children: List.generate(
                    dummydata.length,
                    (index) => Row(
                      children: [
                        UiUtilis.textWidget(
                          titile: dummydata[index].name,
                          context: context,
                          styleType: TextStyleType.caption,
                        ),
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomPaint(
                                size: Size(constraints.maxWidth, 1),
                                painter: DottedLinePainter(),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 12.rw(context)),
                        UiUtilis.textWidget(
                          titile: '\$${dummydata[index].price}',
                          context: context,
                          styleType: TextStyleType.caption,
                        ),
                        SizedBox(width: 6.rw(context)),
                        Checkbox(value: false, onChanged: (value) {}),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.rh(context)),
                Container(
                  height: 30.rh(context),
                  decoration: BoxDecoration(
                    color: AppColor.kPRIMARYCOLOR,
                    borderRadius: BorderRadius.circular(30.rf(context)),
                  ),
                  child: Row(
                    spacing: 12.rw(context),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiUtilis.getSvg(
                        path: SvgConstants.shop,
                        color: AppColor.kScaffoldColor,
                      ),

                      UiUtilis.textWidget(
                        titile: 'Add to Cart',
                        color: AppColor.kScaffoldColor,
                        context: context,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildAppBarMethode(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(28.rh(context)),
      child: Row(
        children: [
          InkResponse(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 15.rf(context),
              color: AppColor.kPRIMARYCOLOR,
            ),
          ),
          SizedBox(width: 6.rw(context)),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UiUtilis.textWidget(
                titile: iteam.titile,
                context: context,
                fz: 15.rf(context),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.rf(context)),
                decoration: BoxDecoration(
                  color: AppColor.kPRIMARYCOLOR,
                  borderRadius: BorderRadius.circular(30.rf(context)),
                ),
                child: Row(
                  children: [
                    UiUtilis.textWidget(
                      titile: iteam.rating.toString(),
                      fz: 15.rf(context),
                      context: context,
                    ),
                    UiUtilis.getSvg(
                      path: SvgConstants.star,
                      height: 12.rf(context),
                      width: 12.rf(context),
                      color: AppColor.kScaffoldColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            radius: 12.5.rf(context),
            backgroundColor:
                iteam.fav ? AppColor.kBrownColor : AppColor.kRedColor,
            child: Icon(
              Icons.favorite,
              size: 14.rf(context),
              weight: 1.rf(context),
              color: iteam.fav ? AppColor.kRedColor : AppColor.kGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double dashWidth = 3;
    const double dashSpace = 3;
    final paint =
        Paint()
          ..color = Colors.deepOrange.withOpacity(0.3)
          ..strokeWidth = 1;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
