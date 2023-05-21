import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_colors.dart';
import '../../utils/styles.dart';
import '../product_stepper_widget.dart';

class CartListItemWidget extends StatelessWidget {
  CartListItemWidget({
    super.key,
  });

  final formatter = NumberFormat.decimalPattern();

  final String productImagePath = 'assets/images/dummy_shoe.png';
  final String productName = 'Adidas Casual Shoe A1983';
  final String color = 'Red';
  final String size = '41';
  final double price = 4999;
  final String qty = '1';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(productImagePath,
                  fit: BoxFit.cover,
                  width: 110,
                  height: 80,
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
                            Text(productName,
                              style: titleTextStyle.copyWith(
                                  fontSize: 14,
                                  color: greyColor.withOpacity(0.8),
                              ),
                            ),
                            Text(
                              'Color: $color, Size: $size',
                              style: subTitleTextStyle.copyWith(
                                  fontSize: 12,
                                  color: greyColor.withOpacity(0.8),
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
                    children: [
                      Text('৳${formatter.format(price)}', style: const TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),),
                      const Spacer(),
                      const ProductStepperWidget(),
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