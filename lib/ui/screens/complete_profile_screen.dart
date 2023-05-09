import 'package:flutter/material.dart';

import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_field_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              //key: ,
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
                  Text('Complete Profile', style: titleTextStyle),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Get started with us with your details',
                    style: subTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'First Name',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'Last Name',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'Mobile',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    controller: TextEditingController(),
                    hintText: 'City',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    maxLines: 5,
                    controller: TextEditingController(),
                    hintText: 'Shopping Address',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonElevatedButtonWidget(
                    title: 'Complete',
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
