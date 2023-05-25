import 'package:get/get.dart' ;
import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class ProductController extends GetxController {
  bool _getProductsByCategoryInProgress = false;
  bool get getProductsByCategoryInProgress => _getProductsByCategoryInProgress;

  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;
  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();

  Future<bool> getProductsByCategory(int categoryId) async {
    _getProductsByCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: '/ListProductByCategory/$categoryId');
    _getProductsByCategoryInProgress = false;
    if (response.isSuccess) {
      _productByCategoryModel =
          ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }


}
