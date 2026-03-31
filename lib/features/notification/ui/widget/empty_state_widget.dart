import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.imagesEmptyNotifications),
          const SizedBox(height: 20),

          const Text(
            "لا توجد إشعارات حالياً",
            style: AppTextStyles.bold16PrimaryColor,
          ),

          const SizedBox(height: 10),

          const Text(
            "لم تصلك أي تنبيهات بعد. سنقوم بإبلاغك فور وجود تحديثات على طلباتك أو عروض جديدة.",
            style: AppTextStyles.regular12Black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
