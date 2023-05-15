import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/category_card_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavigationBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_outlined, color: greyColor,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4
            ), itemBuilder: (context, index) {
              return const CategoryCardWidget(name: 'Dummy');
          }),
        ),
      ),
    );
  }
}
