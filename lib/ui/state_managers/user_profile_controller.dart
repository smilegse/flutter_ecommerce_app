import 'dart:developer';
import 'package:get/get.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/network_caller.dart';
import '../screens/bottom_nav_bar_screen.dart';
import '../screens/complete_profile_screen.dart';
import 'auth_controller.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;
  bool get getProfileDataInProgress => _getProfileDataInProgress;
  bool _userProfileLogoutInProgress = false;
  bool get userProfileLogoutInProgress => _userProfileLogoutInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    log('User_Profile_Controller token: ${AuthController.token}');
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    log(response.returnData.toString());
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      log('read profile succeed');
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);
      if (profileModel.profiles!.isNotEmpty) {
        Get.find<AuthController>().saveProfileData(profileModel);
      } else {
        log('profile is empty');
        Get.to(const CompleteProfileScreen());
      }
      update();
      return true;
    } else {
      log('read profile failed! Unauthorized');
      log('token: ${AuthController.token}');
      // if (response.statusCode == 401) {
      //   Get.find<AuthController>().logOut();
      //   log('logOut');
      // }
      update();
      return false;
    }
  }

  Future<void> userProfileLogout() async {
    _userProfileLogoutInProgress = true;
    update();
    await Get.find<AuthController>().clearUserData();
    _userProfileLogoutInProgress = false;
    update();
    Get.offAll(const BottomNavBarScreen());
  }



}
