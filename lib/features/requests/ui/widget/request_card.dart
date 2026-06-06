import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:intl/intl.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    super.key,
    required this.serviceName,
    required this.date,
    required this.serviceIcon,
  });
  final String serviceName;
  final DateTime date;
  final IconData serviceIcon; // Replace with actual icon based on serviceName

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
              child: Icon(serviceIcon, size: 40, color: AppColors.primaryColor),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  serviceName,
                  style: AppTextStyles.regular16Black,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  DateFormat(
                    'd MMMM y',
                    'ar',
                  ).format(DateTime.parse(date.toString())),
                  style: AppTextStyles.regular16GrayBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
