import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_container.dart';

class TechnicianCard extends StatelessWidget {
  const TechnicianCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(Assets.imagesUserImage),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مكاريوس عماد",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text("سباك وكشف تسريبات", style: TextStyle(color: Colors.grey)),
            ],
          ),
          Spacer(),
          Icon(Icons.star, color: AppColors.yellow),
          Text("4.7", style: AppTextStyles.regular16PrimaryColor),
        ],
      ),
    );
  }
}
