import 'package:ecommerce_app/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_app/ui/state_managers/user_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_field_widget.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (authController) {
        return Padding(
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
                  height: 16,
                ),
                Text('Welcome Back', style: titleTextStyle),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please Enter Your Email Address',
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 24,
                ),
                CommonTextFieldWidget(
                  controller: _emailETController,
                  hintText: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter a email address';
                    } else if (!validateEmail(value!)) {
                      return 'Enter valid email address';
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                authController.emailVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButtonWidget(
                        title: 'Next',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final bool response = await authController
                                .emailVerification(_emailETController.text);
                            if (response) {
                              Get.to(OtpVerificationScreen(
                                  email: _emailETController.text));
                            } else {
                              const GetSnackBar(
                                title: 'Email Verification Failed',
                                message: 'There is something wrong.',
                                duration: Duration(
                                  seconds: 3,
                                ),
                              );
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
