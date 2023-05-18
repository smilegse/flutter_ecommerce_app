import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/styles.dart';
import '../product_stepper_widget.dart';

class CartListItemWidget extends StatelessWidget {
  const CartListItemWidget({
    super.key,
  });

  // final String productImagePath;
  // final String productName;
  // final String color;
  // final String size;
  // final String price;
  // final String qty;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/dummy_shoe.png',
                  fit: BoxFit.cover,
                  width: 80,
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
                              'Adidas Casual Shoe A1983',
                              style: titleTextStyle.copyWith(
                                  fontSize: 16,
                                  color: greyColor
                              ),
                            ),
                            Text(
                              'Color: Red, Size: 41',
                              style: subTitleTextStyle.copyWith(
                                  fontSize: 12,
                                  color: greyColor
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                            color: lightGreyColor,
                            iconSize: 32,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text('\৳ 100', style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),),
                      Spacer(),
                      ProductStepperWidget(),
                    ],
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