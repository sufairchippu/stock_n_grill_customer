import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_n_grill_customer/controller/home_screen_controller.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> caroImage = [
    ImageConstant.CAROSAL1,
    ImageConstant.CAROSAL2,
    ImageConstant.CAROSAL3,
    ImageConstant.CAROSAL4,
  ];

  final List<String> category = [
    "All",
    "Alfam",
    "Shawai",
    "Shawarma",
    "Beverages",
    "Extras",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image Carousel
              carosalMethod1(),
              const SizedBox(height: 20),

              // Category Selector
              _CategorySelectorMethode2(categories: category),
            ],
          ),
        ),
      ),
    );
  }

  FanCarouselImageSlider carosalMethod1() {
    return FanCarouselImageSlider.sliderType1(
              imagesLink: caroImage,
              isAssets: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              sliderHeight: 250,
              sidesOpacity: 0.1,
              expandFitAndZoomable: true,
              isClickable: true,
              imageFitMode: BoxFit.cover,
              userCanDrag: true,
            );
  }
}

class _CategorySelectorMethode2 extends StatelessWidget {
  final List<String> categories;

  const _CategorySelectorMethode2({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(border: Border.all(width: 1.4,color: ColorConstant.PRIMARYCOLOR),
        borderRadius: BorderRadius.circular(8),
        color: ColorConstant.SECONDARYCOLOR4,
      ),
      height: 35,
      child: Center(
        child: SizedBox(
          height: 50,
          child: Consumer<HomeScreenController>(
            builder: (context, homeScreenState, child) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final isSelected = homeScreenState.currentIndex == index;
                  return InkWell(
                    onTap: () {
                      context.read<HomeScreenController>().onCategerieSelection(
                        seletedIndex: index,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:9,top:3,bottom: 3),
                      child: Container(
                        width: 90,
                        height: 15,
                        decoration: BoxDecoration(
                          color:
                              isSelected
                                  ? ColorConstant.PRIMARYCOLOR
                                  : ColorConstant.SECONDARYCOLOR4,
                          border: Border.all(width: 1.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color:
                                  isSelected
                                      ? ColorConstant.SECONDARYCOLOR4
                                      : ColorConstant.PRIMARYCOLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
