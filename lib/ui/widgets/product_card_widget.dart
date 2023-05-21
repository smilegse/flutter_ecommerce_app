import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../screens/product_details_screen.dart';
import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  ProductCardWidget({
    super.key,
  });

  final formatter = NumberFormat.decimalPattern();
  final double price = 4999;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 124,
      child: InkWell(
        onTap: () {
          Get.to(const ProductDetailsScreen());
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: primaryColor.withOpacity(0.3),
          child: Column(
            children: [
              Image.asset(
                'assets/images/dummy_shoe.png',
                width: 110,
                height: 80,
                fit: BoxFit.cover,

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Nike Casual Shoe A3453G',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                        height: 1.2 ,
                        color: greyColor.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '৳${formatter.format(price)}',
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryColor
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const [
                            Icon(Icons.star, color: Colors.amber,size: 14,),
                            Text('4.5', style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: lightGreyColor
                            ),),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.favorite_border, size: 16, color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}