import 'dart:developer';
import 'package:ecommerce_app/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/models/reviews_model.dart';
import '../../data/services/network_caller.dart';

class ReviewsController extends GetxController {
  bool _getReviewsInProgress = false;
  bool get getReviewsInProgress => _getReviewsInProgress;

  bool _createReviewsInProgress = false;
  bool get createReviewsInProgress => _createReviewsInProgress;

  ReviewsModel _reviewsModel = ReviewsModel();
  ReviewsModel get reviewsModel => _reviewsModel;

  Future<bool> getReviewsByProductId(int productId) async {
    log(productId.toString());
    _getReviewsInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListReviewByProduct/$productId');
    _getReviewsInProgress = false;
    if (response.isSuccess) {
      _reviewsModel = ReviewsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> createProductReviews(Map<String, dynamic>? body) async {
    _createReviewsInProgress = true;
    update();
    final response = await NetworkCaller.postRequest(
        url: '/CreateProductReview', body: body);
    _createReviewsInProgress = false;

    log('log response: ${response.returnData}');

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
