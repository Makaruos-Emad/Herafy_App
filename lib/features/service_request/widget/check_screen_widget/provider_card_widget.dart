
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/base_card_container.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/warning_banner.dart';
class ProviderCard extends StatelessWidget {
  final double width;

  const ProviderCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: width * 0.07,
                backgroundImage: AssetImage(Assets.imagesUserImage),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "محمد علي",
                      style: AppTextStyles.semiBold20Black.copyWith(
                        fontSize: width * 0.045,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "سباك وكشف تسريبات",
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),
              Text("4.5", style: AppTextStyles.regular16PrimaryColor),
              const SizedBox(width: 5),
              const Icon(Icons.star, color: Colors.amber),
            ],
          ),

          const SizedBox(height: 8),

          Text("(127 تقييم)", style: AppTextStyles.regular16GrayBlue),

          const SizedBox(height: 10),

          WarningBanner(width: width),
        ],
      ),
    );
  }
}