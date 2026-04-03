import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/features/service_request/data/best_tech_model.dart';

class BestTechItems extends StatelessWidget {
  const BestTechItems({super.key, required this.bestTechnical});
  final BestTechnicalModel bestTechnical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
        ),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      Assets.imagesNoImage,
                      height: 90,
                      width: 88,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              bestTechnical.name,
                              style: AppTextStyles.semiBold20Black,
                            ),
                            const Spacer(),
                            Text(
                              bestTechnical.rating.toStringAsFixed(1),
                              style: AppTextStyles.semiBold20Black,
                            ),
                            const SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                          ],
                        ),
                        Text(
                          bestTechnical.description,
                          style: AppTextStyles.regular16GrayBlue,
                        ),
                        Row(
                          children: [
                            Text("سعر المعاينة : "),
                            Text(
                              " ${bestTechnical.workingPrice}  ج.م",
                              style: AppTextStyles.semiBold20Black.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                            ),
                            Text(
                              "يبعد ${bestTechnical.distance} كم",
                              style: AppTextStyles.regular16GrayBlue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.technicialSelectedProfileScreen);
                },
                textStyle: AppTextStyles.regular16PrimaryColor,
                side: const BorderSide(color: AppColors.primaryColor),
                backgroundColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "عرض الملف",
                      style: AppTextStyles.regular16PrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
