import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:intl/intl.dart';

class UpcomingTechnicianRequestsItem extends StatelessWidget {
  const UpcomingTechnicianRequestsItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule, color: AppColors.grayBlue, size: 20),
                    SizedBox(width: 5),
                    Text(
                      DateFormat(
                        'hh:mm a',
                        'ar',
                      ).format(DateTime.now().subtract(Duration(days: 2))),
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                  ],
                ),
                CircleAvatar(radius: 6, backgroundColor: Colors.green),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_2_outlined, color: AppColors.grayBlue),
                SizedBox(width: 5),
                Text("محمد عبد الرحمن", style: AppTextStyles.regular12Black),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: AppColors.grayBlue),
                SizedBox(width: 5),
                Text("مدينة نصر", style: AppTextStyles.regular12Black),
              ],
            ),
            SizedBox(height: 8),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.taskDetailsScreen);
              },
              text: "بدء المهمة",
            ),
          ],
        ),
      ),
    );
  }
}
