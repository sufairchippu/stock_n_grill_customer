import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_n_grill_customer/DUMMY/dummyy.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

import '../../../../core/const/color_constant.dart';
import '../../../../core/theme/font_const.dart';
import '../../../../core/utilities/custom_canvas/ui_utilis.dart';

class OgHomeScreen extends StatelessWidget {
  const OgHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Dummy.dataaaaa;
    return CustomScrollView(
      slivers: [
        // Best Seller Header Section
        SliverToBoxAdapter(
          child: Row(
            children: [
              UiUtilis.textWidget(
                titile: 'Best Seller',
                context: context,
                styleType: TextStyleType.label,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // Handle "View All" tap
                },
                child: Row(
                  children: [
                    UiUtilis.textWidget(
                      titile: 'View All',
                      context: context,
                      color: AppColor.kPRIMARYCOLOR,
                    ),
                    SizedBox(width: 4.rw(context)),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16.rf(context),
                        color: AppColor.kPRIMARYCOLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 16.rh(context))),

        // Best Seller Items Grid
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120.rh(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Or use your actual data length
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.push('/iteam', extra: data[index]);
                  },
                  child: Container(
                    width: 85.rw(context),
                    margin: EdgeInsets.only(right: 12.rw(context)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.rf(context)),
                          child: Image.network(
                            'https://t3.ftcdn.net/jpg/02/48/92/96/360_F_248929619_JkVBYroM1rSrshWJemrcjriggudHMUhV.jpg',
                            height: 120.rh(context),
                            width: 85.rw(context),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 120.rh(context),
                                width: 85.rw(context),
                                decoration: BoxDecoration(
                                  color: AppColor.kThirdColor,
                                  borderRadius: BorderRadius.circular(
                                    15.rf(context),
                                  ),
                                ),
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: AppColor.kTextColor,
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 120.rh(context),
                                width: 85.rw(context),
                                decoration: BoxDecoration(
                                  color: AppColor.kThirdColor,
                                  borderRadius: BorderRadius.circular(
                                    15.rf(context),
                                  ),
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColor.kPRIMARYCOLOR,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 8.rh(context),
                          child: Container(
                            height: 20.rh(context),
                            width: 45.rw(context),
                            decoration: BoxDecoration(
                              color: AppColor.kPRIMARYCOLOR,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.rf(context)),
                                bottomLeft: Radius.circular(15.rf(context)),
                              ),
                            ),
                            child: Center(
                              child: UiUtilis.textWidget(
                                titile: '\$${(index + 1) * 10}.${index * 2}0',
                                context: context,
                                styleType: TextStyleType.dollar,
                                color: AppColor.kScaffoldColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 24.rh(context))),

        // Promotional Banner
        SliverToBoxAdapter(
          child: Container(
            height: 140.rh(context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.rf(context)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.kPRIMARYCOLOR),
                      child: Padding(
                        padding: EdgeInsets.all(16.rf(context)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiUtilis.textWidget(
                              titile: 'Experience our\nDelicious new dish',
                              textAlign: TextAlign.center,
                              context: context,
                              styleType: TextStyleType.button,
                              color: AppColor.kScaffoldColor,
                            ),
                            SizedBox(height: 8.rh(context)),
                            UiUtilis.textWidget(
                              titile: '30% OFF',
                              context: context,
                              styleType: TextStyleType.headline1,
                              color: AppColor.kScaffoldColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.network(
                      'https://t3.ftcdn.net/jpg/02/48/92/96/360_F_248929619_JkVBYroM1rSrshWJemrcjriggudHMUhV.jpg',
                      height: 160.rh(context),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 160.rh(context),
                          color: AppColor.kThirdColor,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColor.kTextColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 24.rh(context))),

        // Recommendations Section
        SliverToBoxAdapter(
          child: UiUtilis.textWidget(
            titile: 'Recommend',
            context: context,
            styleType: TextStyleType.label,
          ),
        ),

        // Spacing
        SliverToBoxAdapter(child: SizedBox(height: 16.rh(context))),

        // Recommended Items
        SliverToBoxAdapter(
          child: SizedBox(
            height: 140.rh(context),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.rw(context)),
              scrollDirection: Axis.horizontal,
              itemCount: 2, // Or use your actual data length
              itemBuilder: (context, index) {
                return Container(
                  width: 160.rw(context),
                  margin: EdgeInsets.only(right: 12.rw(context)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.rf(context)),
                        child: Image.network(
                          index == 0
                              ? "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&h=300&fit=crop"
                              : "https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=400&h=300&fit=crop",
                          height: 140.rh(context),
                          width: 160.rw(context),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8.rh(context),
                        left: 8.rw(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.rw(context),
                            vertical: 4.rh(context),
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.kScaffoldColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12.rf(context)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 14.rf(context),
                              ),
                              SizedBox(width: 2.rw(context)),
                              UiUtilis.textWidget(
                                titile: '5.0',
                                context: context,
                                styleType: TextStyleType.button,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8.rh(context),
                        right: 8.rw(context),
                        child: Container(
                          padding: EdgeInsets.all(4.rf(context)),
                          decoration: BoxDecoration(
                            color: AppColor.kScaffoldColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12.rf(context)),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColor.kPRIMARYCOLOR,
                            size: 16.rf(context),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 8.rh(context),
                        child: Container(
                          height: 20.rh(context),
                          width: 50.rw(context),
                          decoration: BoxDecoration(
                            color: AppColor.kPRIMARYCOLOR,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.rf(context)),
                              bottomLeft: Radius.circular(15.rf(context)),
                            ),
                          ),
                          child: Center(
                            child: UiUtilis.textWidget(
                              titile: index == 0 ? '\$10.0' : '\$25.0',
                              context: context,
                              styleType: TextStyleType.dollar,
                              color: AppColor.kScaffoldColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        // Bottom spacing
        SliverToBoxAdapter(child: SizedBox(height: 24.rh(context))),
      ],
    );
  }
}
