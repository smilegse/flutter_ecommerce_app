import 'dart:developer';

import 'package:ecommerce_app/ui/screens/bottom_nav_bar_screen.dart';
import 'package:ecommerce_app/ui/state_managers/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import 'home_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text('Enter OTP Code', style: titleTextStyle),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  appContext: context,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                    activeColor: primaryColor,
                    inactiveColor: primaryColor,
                    inactiveFillColor: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _otpTEController,
                  keyboardType: TextInputType.number,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Otp is empty';
                    } else if (input.length < 4) {
                      return 'Input full OTP number';
                    }
                    return null;
                  },
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (value) {},
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                  GetBuilder<UserAuthController>(builder: (userAuthController) {
                    if (userAuthController.otpVerificationInProgress) {
                      const CircularProgressIndicator();
                    }
                      return CommonElevatedButtonWidget(
                        title: 'Next',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await userAuthController.otpVerification(widget.email, _otpTEController.text);
                            if (response) {
                              log('login OTP = true');
                              Get.offAll(const HomeScreen());
                            } else {
                              log('login OTP = false');
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: 'Otp Verification Failed',
                                  message: 'Check once again before enter your OTP',
                                  duration: Duration(seconds: 3,),
                                ),
                              );
                            }
                          }
                        },
                      );
                    }
                  ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 12, color: greyColor),
                    text: 'This code will expire in ',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        text: '120s',
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
