import 'dart:developer';
import 'package:get/get.dart';
import '../../data/models/cart_model.dart';
import '../../data/services/network_caller.dart';
import 'auth_controller.dart';

class CartController extends GetxController {
  bool _getCartInProgress = false;

  bool get getCartInProgress => _getCartInProgress;

  bool _addToCartInProgress = false;

  bool get addToCartInProgress => _addToCartInProgress;

  CartModel _cartModel = CartModel();

  CartModel get cartModel => _cartModel;

  Future<bool> getCartItem() async {
    _getCartInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CartList');
    log(response.returnData.toString());
    _getCartInProgress = false;
    if (response.isSuccess) {
      _cartModel = CartModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }

  Future<bool> addToCart(int productId, String size, String color) async {
    _addToCartInProgress = true;
    update();
    final response = await NetworkCaller.postRequest(
        url: '/CreateCartList',
        body: {"product_id": productId, "color": color, "size": size});
    _addToCartInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}
