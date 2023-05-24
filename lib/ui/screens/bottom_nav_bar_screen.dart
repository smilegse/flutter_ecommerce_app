import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../state_managers/user_profile_controller.dart';
import '../utils/app_colors.dart';
import 'cart_screen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'wish_list_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  @override
  void initState() {
    super.initState();
    //Get.find<UserProfileController>().getProfileData();
  }

  final List<Widget> _screen = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          //log(controller.selectedIndex.toString());
          return _screen[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value) {
              controller.changeIndex(value);
            },
            elevation: 8,
            selectedItemColor: primaryColor,
            unselectedItemColor: lightGreyColor,
            showUnselectedLabels: true,
            unselectedLabelStyle: const TextStyle(
              color: lightGreyColor,
            ),
            currentIndex: controller.selectedIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Categories',
                icon: Icon(Icons.grid_view_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Cart',
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Wishlist',
                icon: Icon(Icons.favorite_border_outlined),
              )
            ],
          );
        },
      ),
    );
  }
}
