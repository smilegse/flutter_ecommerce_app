import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CommonTextFieldWidget extends StatelessWidget {
  const CommonTextFieldWidget({
    super.key, required this.controller,
    required this.validator, required this.hintText,
    this.textInputType, this.maxLines,
  });

  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final TextInputType? textInputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: lightGreyColor,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}