import 'dart:developer';
import 'package:ecommerce_app/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_app/ui/screens/user_profile_screen.dart';
import 'package:get/get.dart';
import '../../data/models/profile_model.dart';
import '../../data/services/network_caller.dart';
import 'auth_controller.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      log('ReadProfile API - response:  ${response.returnData.toString()}');
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);
      log('profileModel - fromJson:  ${profileModel.msg.toString()}');
      if (profileModel.profiles!.isNotEmpty) {
        log('profile is not empty');
        Get.find<AuthController>().saveProfileData(profileModel);
      } else {
        log('profile is empty');
        Get.to(const UserProfileScreen());
      }
      update();
      return true;
    } else {
      log('read profile failed');
      if (response.statusCode == 401) {
        Get.find<AuthController>().clearUserData();
        //log('logOut');
      }
      update();
      return false;
    }
  }
}
