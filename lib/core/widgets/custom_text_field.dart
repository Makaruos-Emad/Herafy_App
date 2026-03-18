import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, this.prefixIcon});
  final String hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,

        border: borderStyle(color: AppColors.lightGrayBlue),
        focusedBorder: borderStyle(color: AppColors.primaryColor),
      ),
    );
  }

  OutlineInputBorder borderStyle({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
