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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageSize = constraints.maxWidth < 170 ? 92.0 : 112.0;

          return Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 190),
            padding: const EdgeInsets.all(12),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image, height: imageSize, width: imageSize),
                const SizedBox(height: 8),
                Text(title, style: AppTextStyles.semiBold20Black),
                const SizedBox(height: 6),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular16GrayBlue,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
