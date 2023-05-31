
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';
import '../state_managers/wish_list_controller.dart';
import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await Get.find<WishListController>().getWishlist();
    });
  }

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
        body: GetBuilder<WishListController>(
          builder: (wishListController) {
            if(wishListController.getWishListInProgress){
              return const Center(
                  child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async{
                await Get.find<WishListController>().getWishlist();
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.75),
                itemCount:
                wishListController.wishListModel.wishes?.length ?? 0,
                itemBuilder: (context, index) {
                  return ProductCardWidget(
                    product: wishListController.wishListModel.wishes![index].product!,
                  );
                },
              ),
            );
          }
        ),
      ),
    );
  }
}