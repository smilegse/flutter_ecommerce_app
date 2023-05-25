import 'package:ecommerce_app/ui/state_managers/see_all_product_by_remark_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widgets/product_card_widget.dart';

class ProductSeeAllByRemarkScreen extends StatefulWidget {
  final String remark;

  const ProductSeeAllByRemarkScreen({Key? key, required this.remark})
      : super(key: key);

  @override
  State<ProductSeeAllByRemarkScreen> createState() => _ProductSeeAllByRemarkScreen();
}

class _ProductSeeAllByRemarkScreen extends State<ProductSeeAllByRemarkScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<SeeAllProductByRemarkController>().getProductsByRemark(widget.remark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.remark),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<SeeAllProductByRemarkController>(builder: (seeAllProductByRemarkController) {
        if (seeAllProductByRemarkController.getProductsByRemarkInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          itemCount:
          seeAllProductByRemarkController.productsByRemarkModel.products?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCardWidget(
              product: seeAllProductByRemarkController.productsByRemarkModel.products![index],
            );
          },
        );
      }),
    );
  }
}
