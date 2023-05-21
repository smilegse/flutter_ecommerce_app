import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/cart/cart_list_item_widget.dart';
import '../widgets/common_elevated_button_widget.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final formatter = NumberFormat.decimalPattern();
  final double totalAmount = 50000;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavigationBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_outlined, color: greyColor,),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CartListItemWidget(),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: greyColor,
                          ),
                        ),
                        Text('৳${formatter.format(totalAmount)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 120,
                      child: CommonElevatedButtonWidget(
                        title: 'Checkout',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


