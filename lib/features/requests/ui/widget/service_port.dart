import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';

class ServicePort extends StatelessWidget {
  const ServicePort({
    super.key,
    required this.nameTechnician,
    required this.ratingAvg,
    required this.imageTecURL,
  });
  final String nameTechnician;
  final double ratingAvg;
  final String imageTecURL;

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
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imageTecURL),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("نفذ بواسطة", style: AppTextStyles.regular12Black),
                    SizedBox(height: 8),
                    Text(nameTechnician, style: AppTextStyles.regular16Black),
                    SizedBox(height: 8),
                    RatingBarIndicator(
                      rating: ratingAvg,
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
