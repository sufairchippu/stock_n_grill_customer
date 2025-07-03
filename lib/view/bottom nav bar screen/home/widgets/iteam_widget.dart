import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';

import '../../../../core/theme/font_const.dart';
import '../../../../core/utilities/custom_canvas/ui_utilis.dart';

class IteamWidget extends StatelessWidget {
  const IteamWidget({
    super.key,
    required this.titile,
    required this.rating,
    required this.fav,
    required this.image,
    required this.price,
    required this.discrption,
    this.video,
    required this.category,
    this.ontap,
  });
  final String titile;
  final double rating;
  final bool fav;
  final String image;
  final double price;
  final String discrption;
  final String? video;
  final String category;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30.rf(context))),
            child: Image.network(
              "https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg", //     image,
              height: 160.rh(context),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + Rating + Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: UiUtilis.textWidget(
                      titile: titile, // "Fresh Prawn Ceviche",
                      context: context,
                      maxLines: 1,
                      styleType: TextStyleType.subtitle1,
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating.toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.orange),
                  ),
                  const Spacer(),
                  Text(
                    "\$$price",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Description
              UiUtilis.textWidget(
                titile: discrption,
                // "Shrimp marinated in zesty lime juice, mixed with crisp onions, tomatoes, and cilantro",
                context: context,

                styleType: TextStyleType.subtitle2,
                // style: TextStyle(
                //   fontSize: 14,
                //   color: Colors.grey[700],
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
