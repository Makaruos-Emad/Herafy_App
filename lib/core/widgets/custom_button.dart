import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.textStyle,
    this.side,
  });
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final TextStyle? textStyle;
  final BorderSide? side;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: side,
          backgroundColor:
              onPressed == null
                  ? (disabledBackgroundColor ?? AppColors.lightGray)
                  : (backgroundColor ?? AppColors.primaryColor),
        ),
        onPressed: onPressed,
        child: Text(text, style: textStyle ?? AppTextStyles.semiBold16White),
      ),
    );
  }
}
