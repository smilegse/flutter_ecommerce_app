import 'package:get/get.dart' ;
import '../../data/models/product_details_model.dart';
import '../../data/services/network_caller.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetailsModel _productDetailsModel = ProductDetailsModel();
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductDetails(int productId) async {
    _getProductDetailsInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: '/ProductDetailsById/$productId');
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}
