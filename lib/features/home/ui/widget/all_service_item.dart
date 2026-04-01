import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/home/model/all_services_item_model.dart';

class AllServiceItem extends StatelessWidget {
  final AllServicesItemModel service;
  final VoidCallback? onTap;

  const AllServiceItem({super.key, required this.service, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service.icon, color: AppColors.primaryColor, size: 30),
            SizedBox(height: 5),
            Text(
              service.title,
              style: AppTextStyles.regular12Black,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
