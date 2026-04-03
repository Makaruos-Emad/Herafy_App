
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final double width;
  final String text;

  const SectionTitle({super.key, required this.width, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.semiBold20Black.copyWith(fontSize: width * 0.045),
    );
  }
}