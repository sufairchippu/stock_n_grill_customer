import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_n_grill_customer/core/const/svg_constants.dart';
import 'package:stock_n_grill_customer/core/mesurment/responsive_size.dart';
import 'package:stock_n_grill_customer/core/theme/font_const.dart';
import 'package:stock_n_grill_customer/core/utilities/custom_canvas/ui_utilis.dart';
import 'package:stock_n_grill_customer/core/utilities/validator.dart';
import 'package:stock_n_grill_customer/services/storage_values/local_storage.dart';
import 'package:stock_n_grill_customer/shared/input_field_widget.dart';
import 'package:stock_n_grill_customer/core/const/color_constant.dart';
import 'package:stock_n_grill_customer/core/const/image_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwControl = TextEditingController();
  final formkeyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 30.rw(context),
          right: 15.rw(context),
          top: 20.rh(context),

          bottom: 25.rh(context),
        ),
        child: Form(
          key: formkeyy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.rh(context)),
              const AuthLogoWidget(),
              SizedBox(height: 10.rh(context)),
              UiUtilis.textWidget(
                titile: "Register or login in stoke!!",
                context: context,
                styleType: TextStyleType.headline0,
              ),
              SizedBox(height: 20.rh(context)),

              UiUtilis.getSvg(
                path: SvgConstants.star,
                height: 50,
                width: 50,
                color: AppColor.kBrownColor,
              ),
              SizedBox(height: 20.rh(context)),
              Text(
                "Enter the email and password to be connected again!!",
                style: GoogleFonts.aclonica(
                  fontSize: 14.rf(context),
                  color: AppColor.kSECONDARYCOLOR3,
                ),
              ),
              SizedBox(height: 20.rf(context)),
              InputFieldWidget(
                labelText: "Email",
                obscureText: false,
                inputController: emailcontroler,
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validator.emailValidation(value),
              ),
              SizedBox(height: 20.rf(context)),
              InputFieldWidget(
                obscureText: true,
                inputController: passwControl,
                validator:
                    (value) => Validator.passwordValidation(
                      value,
                    ), // Validation passed
                hintText: "Enter your password",
                labelText: "Password",
                // keyboardType: TextInputType.,
                // maxLength: 10,
              ),
              SizedBox(height: 50.rh(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.aclonica(
                        color: AppColor.kSECONDARYCOLOR3,
                        fontSize: 12.rf(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: 10.rh(context)),
              Padding(
                padding:  EdgeInsets.all(8.rw(context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't want login",
                          style: GoogleFonts.aclonica(
                            fontSize: 15.rf(context),
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
                              fontSize: 18.rf(context),
                              color: AppColor.kSECONDARYCOLOR3,
                            ),
                          ),
                        ),
                      ],
                    ),
                
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.rf(context)),
                        ),
                        backgroundColor: AppColor.kSECONDARYCOLOR3,
                        foregroundColor: AppColor.kPRIMARYCOLOR,
                      ),
                      onPressed: () async {
                        if (formkeyy.currentState!.validate()) {
                          //   // log("Phone number is ${phonnum.text}");
                          // if (sharedPreferences == null) {
                          //   await _initPreferences();
                
                          //   await sharedPreferences!.setBool("isLogged", true);
                          // }
                          LocalStorage.setBool("isLogged", true);
                
                          context.go('/navbar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "User is Valid ✅${emailcontroler.text}",
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),

              // Spacer(),
              SizedBox(height: 150.rh(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiUtilis.textWidget(
                    context: context,
                    titile: "Don't have any acount Acount?",
                    styleType: TextStyleType.bodyText1,
                    color: AppColor.kThirdColor,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/register');
                    },
                    child: Text(
                      " Register",
                      style: GoogleFonts.aclonica(
                        fontSize: 18.rf(context),
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

class AuthLogoWidget extends StatelessWidget {
  const AuthLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          height: 135.rh(context),
          width: 100.rw(context),
          ImageConstant.PRIMARYLOGO,
        ),
        UiUtilis.textWidget(
          titile: "Stok 'n Grill",
          context: context,
          styleType: TextStyleType.mainHeading,
          color: AppColor.kTextColor,
        ),
      ],
    );
  }
}
//firsty password is kuttu@V8901
//email is sufair@gmail.com