import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/core/utilities/validator.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';
import 'package:stock_n_grill_customer/shared/input_field_widget.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/view/Login%20Screen/login_screen.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  final TextEditingController passwControl = TextEditingController();
  final TextEditingController confrmPasscontr = TextEditingController();
  final TextEditingController emailcont = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 30.rw(context),
          right: 25.rw(context),
          top: 20.rh(context),

          bottom: 5.rh(context),
        ),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.rh(context)),
              const AuthLogoWidget(),
              // SizedBox(height: 29.rh(context)),
              UiUtilis.textWidget(
                titile: "Register or login in stoke!!",
                context: context,
                styleType: TextStyleType.headline0,
              ),

              SizedBox(height: 30.rh(context)),
              Text(
                "Enter the Email & create Password to be connected !",
                style: GoogleFonts.aclonica(
                  fontSize: 14.rf(context),
                  color: AppColor.kSECONDARYCOLOR3,
                ),
              ),
              SizedBox(height: 30.rh(context)),
              InputFieldWidget(
                width: double.infinity,
                obscureText: false,
                labelText: "Email",

                inputController: emailcont,
                hintText: "Enter Your email",
                keyboardType: TextInputType.text,
                validator: (value) => Validator.emailValidation(value),
              ),
              SizedBox(height: 15.rh(context)),
              InputFieldWidget(
                width: double.infinity,
                obscureText: true,
                inputController: passwControl,
                validator: (value) => Validator.passwordValidation(value),
                hintText: "Enter your password",
                labelText: "Password",
                keyboardType: TextInputType.phone,
                // maxLength: 10,
              ),
              SizedBox(height: 15.rh(context)),
              InputFieldWidget(
                width: double.infinity,
                inputController: confrmPasscontr,
                obscureText: true,
                hintText: "Confirm Password",
                labelText: "Password",
                validator: (valu) {
                  if (valu == null || valu.isEmpty) {
                    return "Please enter your password";
                  } else if (valu != passwControl.text) {
                    return "Password does not match";
                  }
                  return null;
                },
              ),
              SizedBox(height: 18.rh(context)),
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
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        LocalStorage.setBool("isLogged", true);
                        context.go('/navbar');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${emailcont.text} is Registered Successfully ",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: GoogleFonts.aclonica(
                      fontSize: 14,
                      color: AppColor.kThirdColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Text(
                      " Login",
                      style: GoogleFonts.aclonica(
                        fontSize: 18,
                        color: AppColor.kSECONDARYCOLOR3,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      context.go('/navbar');
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

              SizedBox(height: 32.rh(context)),
            ],
          ),
        ),
      ),
    );
  }
}
