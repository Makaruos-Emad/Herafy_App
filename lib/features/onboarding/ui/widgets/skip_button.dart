import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextButton(
          onPressed: onPressed,
          child: Text("تخطي", style: AppTextStyles.regular16PrimaryColor),
        ),
      ),
    );
  }
}
