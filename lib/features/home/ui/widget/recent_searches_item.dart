import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class RecentSearchesItem extends StatelessWidget {
  const RecentSearchesItem({super.key, required this.recentSearches});

  final String recentSearches;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.access_time, color: AppColors.lightGrayBlue),
          const SizedBox(width: 8),
          Text(recentSearches, style: AppTextStyles.regular12Black),
        ],
      ),
    );
  }
}
