import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_n_grill_customer/core/routes/app_route_names.dart';
import 'package:stock_n_grill_customer/model/data/iteam_model.dart';
import 'package:stock_n_grill_customer/shared/frames/transitions.dart';
import 'package:stock_n_grill_customer/view/Login%20Screen/login_screen.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/bottom_navbar_sc_view.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/home/home_screen.dart';
import 'package:stock_n_grill_customer/view/iteam_screen/iteam_screen.dart';
import 'package:stock_n_grill_customer/view/register%20screen/register_screen_view.dart';
import 'package:stock_n_grill_customer/view/splash/splash_sc_view.dart';

final GoRouter approute = GoRouter(
  //fo notivfication cuve is >>>>> Curve.easeInOutBack
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: AppRouteNames.splash,
      pageBuilder:
          (context, state) => customTransitionPageWidget(
            Type: Curves.fastLinearToSlowEaseIn,
            child: const SplashScView(),
            key: state.pageKey,
          ),
    ),
    GoRoute(
      path: '/login',
      name: AppRouteNames.login,
      pageBuilder:
          (context, state) => customTransitionPageWidget(
            Type: Curves.easeInOut,
            child: const LoginScreen(),
            key: state.pageKey,
          ),
    ),
    GoRoute(
      path: '/register',
      name: AppRouteNames.register,
      pageBuilder:
          (context, state) => customTransitionPageWidget(
            Type: Curves.easeInOutBack,
            child: const RegisterScreenView(),
            key: state.pageKey,
          ),
    ),
    GoRoute(
      path: '/navbar',
      name: AppRouteNames.navbar,
      pageBuilder:
          (context, state) => customTransitionPageWidget(
            Type: Curves.easeInOut,
            child: const BottomNavbarScView(),
            key: state.pageKey,
          ),
    ),
    GoRoute(
      path: '/home',
      name: AppRouteNames.home,
      pageBuilder:
          (context, state) => customTransitionPageWidget(
            Type: Curves.easeInOut,
            child: const HomeScreen(),
            key: state.pageKey,
          ),
    ),
    GoRoute(
      path: '/iteam',
      name: AppRouteNames.iteam,
      pageBuilder: (context, state) {
        final extraa = state.extra as IteamModel;
        return customTransitionPageWidget(
          child: IteamScreen(iteam: extraa ),
          key: state.pageKey,
          Type: Curves.fastOutSlowIn,
        );
      },
    ),
  ],
);
