import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text("تخطي", style: AppTextStyles.regular16PrimaryColor),
        ),
      ],
    );
  }
}
