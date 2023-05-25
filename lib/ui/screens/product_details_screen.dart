import 'package:ecommerce_app/ui/state_managers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../state_managers/product_details_controller.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import '../widgets/product_details/product_image_carousel_widget.dart';
import '../widgets/product_stepper_widget.dart';
import 'reviews_list_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.productId}) : super(key: key);
  final int productId;


  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List<Color> colors = [];
  List<String> sizes = [];

  final formatter = NumberFormat.decimalPattern();

  Color? _selectedColor ;
  String? _selectedSize ;

  String _totalPrice = '0';

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsController) {
          if(productDetailsController.getProductDetailsInProgress){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final productDetails = productDetailsController.productDetailsModel.data!.first;
          colors = getColors(productDetails.color ?? '');
          sizes = getSizes(productDetails.size ?? '');
          _totalPrice = productDetails.product?.price ?? '0.00' ;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ProductImageCarouselWidget(
                        images: [
                          productDetails.img1 ?? '',
                          productDetails.img2 ?? '',
                          productDetails.img3 ?? '',
                          productDetails.img4 ?? '',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productDetails.product?.title ?? 'Unknown',
                                        style: titleTextStyle.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const Wrap(
                                            crossAxisAlignment: WrapCrossAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                              Text(
                                                '4.8',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: lightGreyColor),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.to(const ReviewsListScreen(

                                              ));
                                            },
                                            child: const Text(
                                              'Reviews',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryColor),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          GetBuilder<WishListController>(
                                            builder: (wishListController) {
                                              if(wishListController.addNewItemInProgress){
                                                return const CircularProgressIndicator();
                                              }
                                              return SizedBox(
                                                height: 20,
                                                width: 20,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    padding: const EdgeInsets.all(2),
                                                  ),
                                                  onPressed: () {
                                                    Get.find<WishListController>().addToWishlist(productDetails.productId!);
                                                  },
                                                  child: const Icon(Icons.favorite_border,size: 16,),
                                                ),
                                              );
                                            }
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const ProductStepperWidget(),
                              ],
                            ),
                            const Text(
                              'Color',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: colors.map((color) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      if (_selectedColor != color) {
                                        _selectedColor = color;
                                        if (mounted) {
                                          setState(() {});
                                        }
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: color,
                                      radius: 15,
                                      child: Visibility(
                                        visible: color == _selectedColor,
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Size',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: sizes.map((size) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      if (_selectedSize != size) {
                                        _selectedSize = size;
                                        if (mounted) {
                                          setState(() {});
                                        }
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color: greyColor,
                                        ),
                                        color: size == _selectedSize ? primaryColor : null,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          size,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: size == _selectedSize ? Colors.white : null,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: greyColor,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              productDetails.product?.shortDes ?? 'Unknown',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: lightGreyColor,
                                letterSpacing: 1.1
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Price',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: greyColor,
                            ),
                          ),
                          Text('৳${formatter.format(double.parse(_totalPrice))}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 120,
                        child: CommonElevatedButtonWidget(
                          title: 'Add To Cart',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  List<String> getSizes(String size){
    return size.split(',');
  }

  List<Color> getColors(String color){
    //log(color);
    List<Color> hexColors = [];
    List<String> colors = color.split(',');
    for (String color in colors){
      color = color.replaceAll('#','0xFF');
      hexColors.add(Color(int.parse(color)));
    }
    //log(hexColors.toString());
    return hexColors;
  }
}
