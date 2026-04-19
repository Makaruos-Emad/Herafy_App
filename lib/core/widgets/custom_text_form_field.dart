import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.textDirection,
    this.suffixText,
    this.prefixIcon,
    this.hintStyle,
    this.labelText,
    this.maxLines = 1,
  });

  final String hintText;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextDirection? textDirection;
  final String? suffixText;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final String? labelText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textDirection: textDirection,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return hintText;
        }
        return null;
      },
      keyboardType: textInputType,
      style: AppTextStyles.regular16Black,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.regular16Black,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        prefixIcon: prefixIcon == null
            ? null
            : Padding(padding: const EdgeInsets.all(15.0), child: prefixIcon),
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
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
    );
  }
}
