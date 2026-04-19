import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/features/service_request/widget/bio_tech_man.dart';
import 'package:herafy/features/service_request/widget/comment_clinte_to_tech.dart';
import 'package:herafy/features/service_request/widget/information_work_item.dart';
import 'package:herafy/features/service_request/widget/previous_work_item.dart';

class TechSelectedProfileBody extends StatelessWidget {
  const TechSelectedProfileBody({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 68,
                  backgroundImage: Image.asset(Assets.imagesNoImage).image,
                ),
              ),

              const Text("اسم الفني", style: AppTextStyles.semiBold20Black),
              const Text(
                "سباك وكشف تسريبات",
                style: AppTextStyles.regular16GrayBlue,
              ),

              Row(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InformationWorkWidget(
                    text: "4.7",
                    icon: Icons.star,
                    iconColor: Colors.amber,
                  ),

                  InformationWorkWidget(
                    text: "120 عملية",
                    icon: Icons.work,
                    iconColor: AppColors.primaryColor,
                  ),

                  InformationWorkWidget(
                    text: "7 سنوات",
                    icon: Icons.workspace_premium,
                    iconColor: AppColors.primaryColor,
                  ),
                ],
              ),

              BioTechnicialMan(),

              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "سابقة الأعمال",
                  style: AppTextStyles.semiBold20Black,
                  textAlign: TextAlign.left,
                ),
              ),

              PreviousWork(),
              CommentWidget(daysAgo: " ٣ اشهر", rating: 3.5),
              CommentWidget(daysAgo: "يومان", rating: 4),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
