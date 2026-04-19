import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGray, width: 1),
      ),
      child: Padding(padding: const EdgeInsets.all(16), child: child),
    );
  }
}
