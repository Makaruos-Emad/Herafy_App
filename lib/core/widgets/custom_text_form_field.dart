import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.textDirection,
    this.suffixText,
    this.prefixIcon,
    this.hintStyle,
    this.labelText,
    this.maxLines = 1,
    this.enableValidation = true,
    this.validator,
  });

  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextDirection? textDirection;
  final String? suffixText;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final String? labelText;
  final int maxLines;
  final bool enableValidation;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: obscureText ? 1 : maxLines,
      controller: controller,
      onChanged: onChanged,
      textDirection: textDirection,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      onSaved: onSaved,
      keyboardType: textInputType,
      style: AppTextStyles.regular16Black,

      validator: enableValidation
          ? (validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return hintText;
                  }
                  return null;
                })
          : null,

      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.regular16Black,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        prefixIcon: prefixIcon == null
            ? null
            : Padding(padding: const EdgeInsets.all(12.0), child: prefixIcon),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(isFocused: true),
      ),
    );
  }

  OutlineInputBorder buildBorder({bool isFocused = false}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.2,
        color: isFocused ? AppColors.primaryColor : Colors.grey.shade300,
      ),
    );
  }
}
