

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CommonElevatedButtonWidget extends StatelessWidget {
  const CommonElevatedButtonWidget({
    super.key, required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
        ),
        child: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, letterSpacing: 0.6),
        ),
      ),
    );
  }
}