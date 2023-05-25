// Analysis: Details - target - deadline -
// Structure - Layer -Feature -Hexa
// State management - Getx
// 1. UI + Functional 2. Statement management 3. Api integration

import 'package:ecommerce_app/ui/state_managers/popular_products_controller.dart';
import 'package:ecommerce_app/ui/state_managers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/state_managers/auth_controller.dart';
import 'ui/state_managers/bottom_navigation_bar_controller.dart';
import 'ui/state_managers/category_controller.dart';
import 'ui/state_managers/home_controller.dart';
import 'ui/state_managers/new_products_controller.dart';
import 'ui/state_managers/product_controller.dart';
import 'ui/state_managers/product_details_controller.dart';
import 'ui/state_managers/special_products_controller.dart';
import 'ui/state_managers/user_auth_controller.dart';
import 'ui/state_managers/user_profile_controller.dart';
import 'ui/utils/app_colors.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBinding(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: greyColor,
            fontWeight: FontWeight.w500,
            fontSize: 18
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}

class GetXBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(UserProfileController());
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(PopularProductsController());
    Get.put(NewProductsController());
    Get.put(SpecialProductsController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(WishListController());

  }

}





