import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/shared/input_field_widget.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/bottom_navbar_sc_view.dart';

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
              SizedBox(height: 10),
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
              SizedBox(height: 29),
              Text(
                "Register or login in stoke!!",
                style: GoogleFonts.aclonica(
                  fontSize: 24,
                  color: ColorConstant.SECONDARYCOLOR3,
                ),
              ),

              SizedBox(height: 25),
              Text(
                "Enter the numbet to be connected",
                style: GoogleFonts.aclonica(
                  fontSize: 12,
                  color: ColorConstant.SECONDARYCOLOR3,
                ),
              ),
              SizedBox(height: 30),
              InputFieldWidget(obscureText:false ,

                inputController: namecontr,
                hintText: "Enter Your name",
                keyboardType: TextInputType.text,
                
              ),SizedBox(height: 20),
              InputFieldWidget(obscureText:false ,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "OTP will send to this number ",
                    style: GoogleFonts.aclonica(
                      color: ColorConstant.SECONDARYCOLOR3,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: ColorConstant.SECONDARYCOLOR3,
                      foregroundColor: ColorConstant.PRIMARYCOLOR,
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        log("Phone number is ${phonnum.text}");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavbarScView(),
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Phone Number is Valid ✅${phonnum.text}",
                            ),
                          ),
                        );
                      }
                    },
                    child: Text("Get OTP"),
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't want login",
                    style: GoogleFonts.aclonica(
                      fontSize: 16,
                      color: ColorConstant.SECONDARYCOLOR4,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbarScView(),
                        ),
                      );
                    },
                    child: Text(
                      " skip >>",
                      style: GoogleFonts.aclonica(
                        fontSize: 18,
                        color: ColorConstant.SECONDARYCOLOR3,
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
