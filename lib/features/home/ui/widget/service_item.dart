import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/features/home/model/service_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel service;

  const ServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 84,
          width: 88,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor,
          ),
          child: const Icon(Icons.home_repair_service),
        ),

        const SizedBox(height: 4),

        Text(service.title, style: AppTextStyles.regular12Black),
      ],
    );
  }
}
