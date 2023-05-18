import 'package:ecommerce_app/ui/screens/reviews_create_screen.dart';
import 'package:get/get.dart';

import '../widgets/reviews_list/reviews_list_item_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8),
                  child: ReviewListItemWidget(
                    name: 'Md. Abu Bakar Siddique',
                    comments: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Reviews (1000)',
                        style: TextStyle(
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
                      onPressed: () {
                        Get.to(const ReviewsCreateScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
