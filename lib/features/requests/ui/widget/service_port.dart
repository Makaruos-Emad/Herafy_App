import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';

class ServicePort extends StatelessWidget {
  const ServicePort({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("تنفيذ الخدمة", style: AppTextStyles.regular16Black),
          SizedBox(height: 8),
          Row(
            children: [
              CircleAvatar(radius: 40),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("نفذ بواسطة", style: AppTextStyles.regular12Black),
                    SizedBox(height: 8),
                    Text("اسم الفني", style: AppTextStyles.regular16Black),
                    SizedBox(height: 8),
                    RatingBarIndicator(
                      rating: 4.5,
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: AppColors.yellow),
                      itemCount: 5,
                      itemSize: 20.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
