import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/utils/auth_utils.dart';
import '../state_managers/user_profile_controller.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../widgets/common_elevated_button_widget.dart';
import 'home_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextField(
                  enabled: false,
                ),
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
                  '${AuthUtils.firstName}  ${AuthUtils.lastName}',
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
                  '${AuthUtils.shippingAddress} }',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'City: ${AuthUtils.city}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Email: ${AuthUtils.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Mobile: ${AuthUtils.mobile}',
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
                CommonElevatedButtonWidget(
                  title: 'Logout',
                  onTap: () async {
                    await AuthUtils.clearData();
                    Get.to(const HomeScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
