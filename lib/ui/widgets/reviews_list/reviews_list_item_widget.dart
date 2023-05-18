import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/styles.dart';

class ReviewListItemWidget extends StatelessWidget {
  const ReviewListItemWidget({
    super.key, required this.name, required this.comments,
  });

  final String name;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        color: lightGreyColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    name,
                                    style: titleTextStyle.copyWith(
                                        fontSize: 16, color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 8,),
                Text(
                  comments,
                  style: TextStyle(
                    fontSize: 15,
                    color: lightGreyColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
