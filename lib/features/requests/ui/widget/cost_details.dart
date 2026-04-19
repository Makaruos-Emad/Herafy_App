import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';

class CostDetails extends StatelessWidget {
  const CostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "تفاصيل التكلفه",
            style: AppTextStyles.semiBold16White.copyWith(
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("رسوم المعاينة", style: AppTextStyles.regular16Black),
              Text(
                "50 ج.م",
                style: AppTextStyles.bold16PrimaryColor.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Divider(thickness: 2, color: AppColors.lightGray),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الاجمالي",
                style: AppTextStyles.bold24DarkBlue.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                "50 ج.م",
                style: AppTextStyles.bold24DarkBlue.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
