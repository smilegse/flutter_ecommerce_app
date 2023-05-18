import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state_managers/bottom_navigation_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavigationBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_outlined, color: greyColor,),
          ),
        ),
        body: GridView.builder(
          itemCount: 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return const ProductCardWidget();
          },
        ),
      ),
    );
  }
}