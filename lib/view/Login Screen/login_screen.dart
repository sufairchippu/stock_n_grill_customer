import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_n_grill_customer/services/global%20widget/input_field_widget.dart';
import 'package:stock_n_grill_customer/services/utilities/color_constant.dart';
import 'package:stock_n_grill_customer/services/utilities/image_constant.dart';
import 'package:stock_n_grill_customer/view/bottom%20nav%20bar%20screen/bottom_navbar_sc_view.dart';
import 'package:stock_n_grill_customer/view/register%20screen/register_screen_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwControl = TextEditingController();
  final formkeyy = GlobalKey<FormState>();
  SharedPreferences? sharedPreferences;
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

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
          key: formkeyy,
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
                  "Enter the email and password to be connected again!!",
                  style: GoogleFonts.aclonica(
                    fontSize: 14,
                    color: ColorConstant.SECONDARYCOLOR3,
                  ),
                ),
                SizedBox(height: 30),
                InputFieldWidget(
                  obscureText: false,
                  inputController: emailcontroler,
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
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
                  // keyboardType: TextInputType.,
                  // maxLength: 10,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.aclonica(
                          color: ColorConstant.SECONDARYCOLOR3,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        // Navigator.pushReplacement(
                      },
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
                      onPressed: () async {
                        if (formkeyy.currentState!.validate()) {
                          //   // log("Phone number is ${phonnum.text}");
                          // if (sharedPreferences == null) {
                          //   await _initPreferences();

                          //   await sharedPreferences!.setBool("isLogged", true);
                          // }
                            await sharedPreferences!.setBool("isLogged", true);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavbarScView(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "User is Valid ✅" + emailcontroler.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),

                // Spacer(),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any acount Acount?",
                      style: GoogleFonts.aclonica(
                        fontSize: 12,
                        color: ColorConstant.SECONDARYCOLOR4,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreenView(),
                          ),
                        );
                      },
                      child: Text(
                        " Register",
                        style: GoogleFonts.aclonica(
                          fontSize: 18,
                          color: ColorConstant.SECONDARYCOLOR3,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 180),
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
//firsty password is kuttu@V8901
//email is sufair@gmail.com