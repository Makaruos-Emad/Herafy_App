import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("4.7", style: AppTextStyles.regular12PrimaryColor),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: AppColors.yellow, size: 18),
                    ],
                  ),
                  SizedBox(width: 5),
                  Text("تنظيف شامل", style: AppTextStyles.regular12Black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
