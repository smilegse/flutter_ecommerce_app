import 'package:get/get.dart';
import '../../data/models/product_by_category_model.dart';
import '../../data/services/network_caller.dart';

class NewProductsController extends GetxController {
  bool _getNewProductByRemarkInProgress = false;
  ProductByCategoryModel _newProducts = ProductByCategoryModel();
  bool get getNewProductByRemarkInProgress => _getNewProductByRemarkInProgress;

  ProductByCategoryModel get newProductsModel => _newProducts;

  Future<bool> getNewProductsByRemark() async {
    _getNewProductByRemarkInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _getNewProductByRemarkInProgress = false;
    if (response.isSuccess) {
      _newProducts = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}
