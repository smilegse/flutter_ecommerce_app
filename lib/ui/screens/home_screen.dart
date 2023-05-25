import 'dart:developer';

import 'package:ecommerce_app/ui/state_managers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../state_managers/auth_controller.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/home/app_bar_icon_button.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remarks_title_widget.dart';
import '../widgets/home/search_text_field_widget.dart';
import '../widgets/product_card_widget.dart';
import 'email_verification_screen.dart';
import 'user_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _makingPhoneCall() async {
    var url = Uri.parse("tel:01780494949");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(
              iconData: Icons.person,
              onTap: () {
                Get.find<AuthController>().isLoggedIn().then((value) {
                  log(value.toString());
                  if (value) {
                    Get.to(const UserProfileScreen());
                  } else {
                    Get.to(const EmailVerificationScreen());
                  }
                });
              },
            ),
            AppBarIconButton(
              iconData: Icons.call,
              onTap: () {
                _makingPhoneCall();
              },
            ),
            AppBarIconButton(
              iconData: Icons.notifications_none,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SearchTextFieldWidget(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(builder: (homeController) {
                if(homeController.getSliderInProgress){
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                  return HomeCarouselWidget(
                    homeSliderModel: homeController.homeSliderModel,
                  );
                }
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'Categories',
                onTapSelectAll: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCardWidget(
                      name: 'Computer',
                    ),
                    CategoryCardWidget(
                      name: 'Electronics',
                    ),
                    CategoryCardWidget(
                      name: 'Clothes',
                    ),
                    CategoryCardWidget(
                      name: 'Grocery',
                    ),
                    CategoryCardWidget(
                      name: 'Computer',
                    ),
                    CategoryCardWidget(
                      name: 'Computer',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'Popular',
                onTapSelectAll: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'Special',
                onTapSelectAll: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'New',
                onTapSelectAll: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
                    ProductCardWidget(),
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
