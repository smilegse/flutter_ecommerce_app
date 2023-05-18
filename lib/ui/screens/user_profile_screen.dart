import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
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
            Text('Md. Abu Bakar Siddique', style: titleTextStyle),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Shopping Address:',
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
              '61, Anamica Housing, Mehedibag Housing, Adabor, Dhaka-1207. ',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Email: siddique@ail-bd.com',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Mobile: 01780494949',
              style: TextStyle(
                fontSize: 18,
                color: greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
