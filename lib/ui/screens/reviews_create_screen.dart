import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/auth_controller.dart';
import '../state_managers/reviews_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/common_text_field_widget.dart';

class ReviewsCreateScreen extends StatefulWidget {
  final int productId;

  const ReviewsCreateScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ReviewsCreateScreen> createState() => _ReviewsCreateScreenState();
}

class _ReviewsCreateScreenState extends State<ReviewsCreateScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewsTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Reviews'),
        leading: const BackButton(
          // onPressed: (){
          //   Get.off(ReviewsListScreen(productId: widget.productId));
          // },
          color: greyColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextFieldWidget(
                    controller: _firstNameTEController,
                    hintText: 'First Name',
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter first name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    controller: _lastNameTEController,
                    hintText: 'Last Name',
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter last name';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CommonTextFieldWidget(
                    maxLines: 10,
                    controller: _reviewsTEController,
                    hintText: 'Write Reviews',
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter reviews';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<ReviewsController>(
                    builder: (reviewsController) {
                      if (reviewsController.createReviewsInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CommonElevatedButtonWidget(
                        title: 'Submit',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final result = await Get.find<AuthController>().checkAuthValidation();
                            if (result) {
                              reviewsController.createProductReviews(
                                {
                                  "description": _reviewsTEController.text,
                                  "product_id": widget.productId
                                },
                              ).then((value) {
                                if (value) {
                                  _firstNameTEController.clear();
                                  _lastNameTEController.clear();
                                  _reviewsTEController.clear();
                                } else {
                                  const GetSnackBar(
                                    title: 'Reviews Notification',
                                    message: 'Reviews added failed!',
                                    duration: Duration(
                                      seconds: 5,
                                    ),
                                  );
                                }
                              });
                            }
                          }
                        },
                      );
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
