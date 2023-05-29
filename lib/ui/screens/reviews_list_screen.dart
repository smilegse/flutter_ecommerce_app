import 'package:ecommerce_app/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';
import '../state_managers/reviews_controller.dart';
import '../widgets/reviews_list/reviews_list_item_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'reviews_create_screen.dart';

class ReviewsListScreen extends StatefulWidget {
  final int productId;
  const ReviewsListScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<ReviewsController>().getReviewsByProductId(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<ReviewsController>(builder: (reviewsController) {
        if (reviewsController.getReviewsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reviewsController.reviewsModel.reviews?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ReviewListItemWidget(
                      name:
                          '${reviewsController.reviewsModel.reviews![index].profile!.firstName ?? 'Unknown'}  ${reviewsController.reviewsModel.reviews![index].profile!.lastName ?? 'Unknown'}',
                      comments: reviewsController
                          .reviewsModel.reviews![index].description!,
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reviews (${reviewsController.reviewsModel.reviews!.length})',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: greyColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64),
                        color: primaryColor,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.white,
                        iconSize: 32,
                        onPressed: () async {
                          final result = await Get.find<AuthController>()
                              .checkAuthValidation();
                          if (result) {
                            Get.to(ReviewsCreateScreen(
                              productId: widget.productId,
                            ));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
