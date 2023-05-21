import 'package:ecommerce_app/data/services/network_caller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationInProgress = false;
  bool get emailVerificationInProgress => _emailVerificationInProgress;

  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: 'UserLogin/$email');
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    }else {
      return false;
    }
  }
}
