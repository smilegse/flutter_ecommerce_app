import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/auth_controller.dart';
import '../state_managers/user_profile_controller.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserProfileController>().getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        leading: const BackButton(
          color: greyColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child:GetBuilder<UserProfileController>(builder: (userProfileController) {
          if (userProfileController.getProfileDataInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(
                        Icons.person,
                        color: lightGreyColor,
                        size: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    '${AuthController.profileData?.profiles!.first.firstName ?? 'Unknown'}  ${AuthController.profileData?.profiles!.first.lastName ?? 'Unknown'}',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Shipping Address:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AuthController.profileData?.profiles!.first.shippingAddress ?? 'Unknown',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'City: ${AuthController.profileData?.profiles!.first.city ?? 'Unknown'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Email: ${AuthController.profileData?.profiles!.first.email ?? 'Unknown'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Mobile: ${AuthController.profileData?.profiles!.first.mobile ?? 'Unknown'}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  GetBuilder<UserProfileController>(builder: (userProfileController) {
                    if (userProfileController.userProfileLogoutInProgress) {
                      return const SizedBox(
                        height: 90,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return CommonElevatedButtonWidget(
                      title: 'Logout',
                      onTap: () {
                        userProfileController.userProfileLogout();
                      },
                    );
                  }),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
