import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/styles.dart';

class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    super.key, required this.remarkName, required this.onTapSelectAll,
  });

  final String remarkName;
  final VoidCallback onTapSelectAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarkName,
          style: titleTextStyle.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: onTapSelectAll,
          child: const Text(
            'See all',
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}