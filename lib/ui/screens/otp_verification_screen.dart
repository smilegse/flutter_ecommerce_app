import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 16,
              ),
              CommonElevatedButtonWidget(
                title: 'Next',
                onTap: () {
                  Get.to(const CompleteProfileScreen());
                },
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
