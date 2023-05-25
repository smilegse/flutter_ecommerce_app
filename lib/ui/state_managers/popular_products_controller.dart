import 'package:get/get.dart';
import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class PopularProductsController extends GetxController {
  bool _getPopularProductByRemarkInProgress = false;
  ProductByCategoryModel _popularProducts = ProductByCategoryModel();
  bool get getPopularProductByRemarkInProgress => _getPopularProductByRemarkInProgress;

  ProductByCategoryModel get popularProductsModel => _popularProducts;

  Future<bool> getPopularProductsByRemark() async {
    _getPopularProductByRemarkInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getPopularProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _popularProducts = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}
