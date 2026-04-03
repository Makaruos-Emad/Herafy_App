import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final double width;

  const InfoItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEFF6FF),
          radius: width * 0.07,
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.regular16GrayBlue),
              Text(
                value,
                style: AppTextStyles.semiBold20Black.copyWith(
                  fontSize: width * 0.045,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}