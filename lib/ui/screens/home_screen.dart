import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../state_managers/auth_controller.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../state_managers/category_controller.dart';
import '../state_managers/home_controller.dart';
import '../state_managers/new_products_controller.dart';
import '../state_managers/popular_products_controller.dart';
import '../state_managers/special_products_controller.dart';
import '../widgets/category_card_widget.dart';
import '../widgets/home/app_bar_icon_button.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/remarks_title_widget.dart';
import '../widgets/home/search_text_field_widget.dart';
import '../widgets/product_card_widget.dart';
import 'email_verification_screen.dart';
import 'product_see_all_by_remark_screen.dart';
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
                //Get.to(const UserProfileScreen());
                Get.find<AuthController>().isLoggedIn().then((value) {
                  if (value) {
                    log('isLoggedIn == true ');
                    Get.to(const UserProfileScreen());
                  } else {
                    log('isLoggedIn == false ');
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
                if (homeController.getSliderInProgress) {
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
              }),
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
              GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.getCategoryInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: categoryController.categoryModel.categories!
                        .map(
                          (category) => CategoryCardWidget(
                              name: category.categoryName.toString(),
                              imageUrl: category.categoryImg.toString(),
                              id: category.id ?? 0),
                        )
                        .toList(),
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'Popular',
                onTapSelectAll: () {
                  Get.to(const ProductSeeAllByRemarkScreen(remark: 'Popular'));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<PopularProductsController>(
                  builder: (popularProductsController) {
                if (popularProductsController
                    .getPopularProductByRemarkInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        popularProductsController.popularProductsModel.products!
                            .map(
                              (product) => ProductCardWidget(
                                product: product,
                              ),
                            )
                            .toList(),
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'Special',
                onTapSelectAll: () {
                  Get.to(const ProductSeeAllByRemarkScreen(remark: 'Special'));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SpecialProductsController>(
                  builder: (specialProductsController) {
                if (specialProductsController
                    .getSpecialProductByRemarkInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                        specialProductsController.specialProductsModel.products!
                            .map(
                              (product) => ProductCardWidget(
                                product: product,
                              ),
                            )
                            .toList(),
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkName: 'New',
                onTapSelectAll: () {
                  Get.to(const ProductSeeAllByRemarkScreen(remark: 'New'));
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<NewProductsController>(
                  builder: (newProductsController) {
                if (newProductsController.getNewProductByRemarkInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: newProductsController.newProductsModel.products!
                        .map(
                          (product) => ProductCardWidget(
                            product: product,
                          ),
                        )
                        .toList(),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
