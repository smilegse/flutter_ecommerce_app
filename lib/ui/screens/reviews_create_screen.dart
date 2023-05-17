import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_field_widget.dart';

class ReviewsCreateScreen extends StatefulWidget {
  const ReviewsCreateScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsCreateScreen> createState() => _ReviewsCreateScreenState();
}

class _ReviewsCreateScreenState extends State<ReviewsCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              //key: ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    maxLines: 10,
                    controller: TextEditingController(),
                    hintText: 'Write Reviews',
                    textInputType: TextInputType.text,
                    validator: (String? value) {},
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonElevatedButtonWidget(
                    title: 'Submit',
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