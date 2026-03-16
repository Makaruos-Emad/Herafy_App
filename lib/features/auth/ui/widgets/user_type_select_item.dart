import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class UserTypeSelectItem extends StatelessWidget {
  const UserTypeSelectItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.selected,
    required this.onTap,
  });
  final String image;
  final String title;
  final String description;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 195,
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryColor.withValues(alpha: 0.12)
              : AppColors.lightGray.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.lightGray,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Image.asset(image, height: 115, width: 115),
            Text(title, style: AppTextStyles.semiBold20Black),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTextStyles.regular16GrayBlue,
            ),
          ],
        ),
      ),
    );
  }
}
