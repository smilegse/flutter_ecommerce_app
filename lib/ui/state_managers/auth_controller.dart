import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/profile_model.dart';
import '../screens/email_verification_screen.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileModel? _profileData;

  static String? get token => _token;
  static ProfileModel? get profileData => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = userToken;
    preference.setString('token', userToken);
  }

  Future<void> saveProfileData(ProfileModel profileModel) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    log('saveProfileData');
    log(profileModel.toString());
    _profileData = profileModel;
    await preference.setString('user_profile', profileModel.toJson().toString());
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('token');
  }

  Future<void> getProfileData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = ProfileModel.fromJson(
      jsonDecode(preference.getString('user_profile') ?? '{}'),
    );
  }

  Future<void> logOut() async {
    await clearUserData();
    Get.to(const EmailVerificationScreen());
  }

  Future<void> clearUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
  }

  Future<bool> checkAuthValidation() async {
    final authState = await Get.find<AuthController>().isLoggedIn();
   if(authState == false){
     Get.to(const EmailVerificationScreen());
   }
    return authState;
  }

}
