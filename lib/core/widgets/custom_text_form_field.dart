import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.textDirection,
    this.suffixText,
  });
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextDirection? textDirection;
  final String? suffixText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: textDirection,
      obscureText: obscureText,

      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return hintText;
        }
        return null;
      },
      keyboardType: textInputType,
      style: AppTextStyles.semiBold16Black,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppTextStyles.semiBold16Black,
        hintText: hintText,
        suffixText: suffixText,

        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
    );
  }
}
