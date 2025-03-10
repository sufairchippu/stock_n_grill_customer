import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_n_grill_customer/services/global%20widget/input_field_widget.dart';
import 'package:stock_n_grill_customer/services/utilities/color_constant.dart';
import 'package:stock_n_grill_customer/services/utilities/image_constant.dart';
import 'package:stock_n_grill_customer/view/Login%20Screen/login_screen.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/bottom_navbar_sc_view.dart';

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
  SharedPreferences? sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 15,
          top: 10,

          bottom: 15,
        ),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
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
                  "Enter the Email & create Password to be connected !",
                  style: GoogleFonts.aclonica(
                    fontSize: 12,
                    color: ColorConstant.SECONDARYCOLOR3,
                  ),
                ),
                SizedBox(height: 30),
                InputFieldWidget(
                  obscureText: false,
                  labelText: "Email",

                  inputController: emailcont,
                  hintText: "Enter Your email",
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    ).hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null; // Validation passed
                  },
                ),
                SizedBox(height: 20),
                InputFieldWidget(
                  obscureText: true,
                  inputController: passwControl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    } else if (!RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    ).hasMatch(value)) {
                      return "Password must include uppercase, lowercase, number, and special character";
                    }
                    return null; // Validation passed
                  },
                  hintText: "Enter your password",
                  labelText: "Password",
                  keyboardType: TextInputType.phone,
                  // maxLength: 10,
                ),
                SizedBox(height: 20),
                InputFieldWidget(
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
                SizedBox(height: 20),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Text(
                //       "OTP will send to this number ",
                //       style: GoogleFonts.aclonica(
                //         color: ColorConstant.SECONDARYCOLOR3,
                //         fontSize: 12,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ],
                // ),
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
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          
                          await sharedPreferences!.setBool("isLogged", true);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavbarScView(),
                              //lohin screen()
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                emailcont.text +
                                    " is Registered Successfully ✅",
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                      style: GoogleFonts.aclonica(
                        fontSize: 14,
                        color: ColorConstant.SECONDARYCOLOR4,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        " Login",
                        style: GoogleFonts.aclonica(
                          fontSize: 18,
                          color: ColorConstant.SECONDARYCOLOR3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 160),
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
      ),
    );
  }
}
