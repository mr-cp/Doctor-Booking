import 'package:doctor_booking/shared_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared_widget/custom_button.dart';
import '../../shared_widget/text_field.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/login_img.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GetBuilder<LoginController>(
                  init: loginController,
                  builder: (loginController) => Form(
                    key: loginController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.035),
                        Text(
                          'Login Or Register To Book Your Appointments',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF404040),
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: h * 0.05),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: CustomText(
                            text: 'Email',
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: h * 0.008),
                        CustomTextFormField(
                            controller: loginController.emailController,
                            hintText: 'Enter your email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field empty';
                              }
                              return null;
                            }),
                        SizedBox(height: h * 0.03),
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: CustomText(
                            text: 'Password',
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: h * 0.008),
                        CustomTextFormField(
                          controller: loginController.passwordController,
                          hintText: 'Enter your password',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: h * 0.09),
                        CustomButton(
                            text: loginController.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize:16
                                    ),
                                  ),
                            backgroundColor: const Color(0xFF006837),
                            textColor: Colors.white,
                            onPressed: () {
                              if (loginController.formKey.currentState
                                      ?.validate() ??
                                  false) {
                                loginController.login(
                                    loginController.emailController.text,
                                    loginController.passwordController.text);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By creating or logging into an account you are agreeing with our ',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          height: 0,
                          letterSpacing: 0.11,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF0028FC),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.11,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.11,
                        ),
                      ),
                      TextSpan(
                        text: 'and',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          height: 0,
                          letterSpacing: 0.11,
                        ),
                      ),
                      TextSpan(
                        text: ' ',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.12,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF0028FC),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
