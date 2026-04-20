import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';

class IconBox extends StatelessWidget {
  const IconBox({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.blue),
    );
  }
}
