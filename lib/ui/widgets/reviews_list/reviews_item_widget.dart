import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class ReviewsItemWidget extends StatelessWidget {
  const ReviewsItemWidget({
    super.key, required this.name, required this.comments,
  });

  final String name ;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.shade200,
                          child: const Icon(
                            Icons.person,
                            color: lightGreyColor,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 20,
                                height: 1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                comments,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: lightGreyColor,
                    height: 1.2

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}