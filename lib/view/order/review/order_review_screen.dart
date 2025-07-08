import 'package:flutter/material.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/shared/frames/custom_base_screen.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBaseScreen(
        title: 'Leave A Review',
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.rf(context)),
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Ice_Cream_dessert_02.jpg/960px-Ice_Cream_dessert_02.jpg", //   iteam.image,     image,

                height: 160.rh(context),
                width: 160.rw(context),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
