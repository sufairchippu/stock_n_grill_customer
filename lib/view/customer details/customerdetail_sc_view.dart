import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/shared/input_field_widget.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';

class CustomerdetailScView extends StatefulWidget {
  const CustomerdetailScView({super.key});

  @override
  State<CustomerdetailScView> createState() => _CustomerdetailScViewState();
}

class _CustomerdetailScViewState extends State<CustomerdetailScView> {
  final TextEditingController phonnum = TextEditingController();
  // final TextEditingController gmaiolcontr = TextEditingController();
  final TextEditingController namecontr = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 15,
          top: 20,

          bottom: 25,
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 135,
                    width: 100,
                    ImageConstant.PRIMARYLOGO,
                  ),
                ],
              ),
              const SizedBox(height: 29),
              Text(
                "Register or login in stoke!!",
                style: GoogleFonts.aclonica(
                  fontSize: 24,
                  color: AppColor.kSECONDARYCOLOR3,
                ),
              ),

              const SizedBox(height: 25),
              Text(
                "Enter the numbet to be connected",
                style: GoogleFonts.aclonica(
                  fontSize: 12,
                  color: AppColor.kSECONDARYCOLOR3,
                ),
              ),
              const SizedBox(height: 30),
              InputFieldWidget(
                obscureText: false,

                inputController: namecontr,
                hintText: "Enter Your name",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              InputFieldWidget(
                obscureText: false,
                inputController: phonnum,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  } else if (value.length < 10) {
                    return "Phone number must be of 10 digits";
                  } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                    return "Enter a valid Phone Number";
                  }
                  return null; // This means validation passed
                },
                hintText: "Enter your phone number",
                labelText: "Phone Number",
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "OTP will send to this number ",
                    style: GoogleFonts.aclonica(
                      color: AppColor.kSECONDARYCOLOR3,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColor.kSECONDARYCOLOR3,
                      foregroundColor: AppColor.kPRIMARYCOLOR,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        log("Phone number is ${phonnum.text}");
                        context.go('/navbar');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Phone Number is Valid ✅${phonnum.text}",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Get OTP"),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't want login",
                    style: GoogleFonts.aclonica(
                      fontSize: 16,
                      color: AppColor.kThirdColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/navbar');
                    },
                    child: Text(
                      " skip >>",
                      style: GoogleFonts.aclonica(
                        fontSize: 18,
                        color: AppColor.kSECONDARYCOLOR3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
