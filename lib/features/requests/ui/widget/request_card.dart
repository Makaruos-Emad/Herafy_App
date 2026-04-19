import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.home_repair_service,
                size: 40,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تأسيس سباكة",
                  style: AppTextStyles.regular16Black,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text("26 يناير 2026", style: AppTextStyles.regular16GrayBlue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
