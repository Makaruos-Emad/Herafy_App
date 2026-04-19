import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class EarningsCard extends StatelessWidget {
  const EarningsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  const Text(
                    "أرباحك اليوم",
                    style: AppTextStyles.regular16White,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.amber),
                    Text("4.9", style: AppTextStyles.regular12Black),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          const Center(
            child: Text("1,450 ج.م", style: AppTextStyles.bold32White),
          ),

          const SizedBox(height: 24),

          /// Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.white),
              color: Colors.white24,
            ),
            child: const Center(
              child: Text(
                "تفاصيل الأرباح",
                style: AppTextStyles.regular16White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
