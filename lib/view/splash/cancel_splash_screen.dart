import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/provider/order/cancel_order/splash_order_cancel_controller.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/routes/app_route_names.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/shared/animations/rotating_avatar_screen.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_base_screen.dart';

import '../../controller/provider/splash/splash_sc_controller.dart';
import '../../core/const/color_constant.dart';

class CancelSplashScreen extends StatefulWidget {
  const CancelSplashScreen({super.key});

  @override
  State<CancelSplashScreen> createState() => _CancelSplashScreenState();
}

class _CancelSplashScreenState extends State<CancelSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => context.goNamed(AppRouteNames.order));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashOrderCancelController>(
      create: (context) => SplashOrderCancelController(),
      child: Consumer<SplashScController>(
        builder:
            (context, value, child) => Scaffold(
              body: CustomBaseScreen(
                onback: () {
                  context.goNamed(AppRouteNames.order);
                },
                title: '',
                basecolor: AppColor.kScaffoldColor,
                child: Column(
                  children: [
                    buildAnimatedSection(),
                    const Spacer(),
                    UiUtilis.textWidget(
                      titile:
                          'If you have any question reach directly to our customer support',
                      context: context,
                      overflow: TextOverflow.ellipsis,
                      styleType: TextStyleType.errorText,
                    ),
                    SizedBox(height: 55.rh(context)),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget buildAnimatedSection() {
    return Consumer<SplashOrderCancelController>(
      builder: (context, value, child) {
        return AnimatedAlign(
          alignment:
              value.isexpanded ? Alignment.topCenter : Alignment.bottomCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: value.isexpanded ? 50 : 200,
                width: value.isexpanded ? 50 : 200,
                curve: Curves.fastLinearToSlowEaseIn,
                child:
                    RotatingAvatarScreen(), // UiUtilis.getSvg(path: SvgConstants.cancel),
              ),
              UiUtilis.textWidget(
                titile: "¡Order Cancelled!",
                context: context,
                styleType: TextStyleType.headline1,
              ),
              const SizedBox(height: 12),

              UiUtilis.textWidget(
                titile: "Your order has been successfully cancelled",
                context: context,
                styleType: TextStyleType.errorText,
              ),
            ],
          ),
        );
      },
    );
  }
}
