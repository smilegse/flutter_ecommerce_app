
import 'package:ecommerce_app/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/network_caller.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);
      if (profileModel.data != null) {
        Get.find<AuthController>().saveProfileData(profileModel.data!.first);
      } else {
        // Get.to('CompleteProfile');
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}