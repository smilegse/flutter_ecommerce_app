import 'package:get/get.dart';
import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class SeeAllProductByRemarkController extends GetxController {
  bool _getProductsByRemarkInProgress = false;
  bool get getProductsByRemarkInProgress => _getProductsByRemarkInProgress;

  ProductByCategoryModel _productsByRemarkModel = ProductByCategoryModel();
  ProductByCategoryModel get productsByRemarkModel => _productsByRemarkModel;

  Future<bool> getProductsByRemark(String remark) async {
    _getProductsByRemarkInProgress = true;
    update();
    final response =
    await NetworkCaller.getRequest(url: '/ListProductByRemark/$remark');
    _getProductsByRemarkInProgress = false;
    if (response.isSuccess) {
      _productsByRemarkModel = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}
