import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';

class ActiveJobCard extends StatelessWidget {
  const ActiveJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text("10:30 ص", style: AppTextStyles.regular14White),
            ),
            const SizedBox(height: 16),
            const Text("صيانة تكييف", style: AppTextStyles.semiBold16White),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 5),
                const Text(
                  "محمد عبد الرحمن",
                  style: AppTextStyles.regular14White,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 5),
                const Text("مدينة نصر", style: AppTextStyles.regular14White),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: () {},
              text: "بدء المهمة",
              textStyle: AppTextStyles.semiBold16White.copyWith(
                color: AppColors.primaryColor,
              ),
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
