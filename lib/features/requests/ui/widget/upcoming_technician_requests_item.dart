import 'package:flutter/material.dart';
import 'package:herafy/core/routing/routes.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/time_formatting.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';

class UpcomingTechnicianRequestsItem extends StatelessWidget {
  const UpcomingTechnicianRequestsItem({
    super.key,
    required this.technicianOrderModel,
  });

  final TechnicianOrderModel technicianOrderModel;

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
                    Icon(Icons.schedule, color: AppColors.grayBlue, size: 25),
                    SizedBox(width: 5),
                    Text(
                      formatTime(technicianOrderModel.scheduledTime),
                      style: AppTextStyles.regular16Black,
                    ),
                  ],
                ),
                CircleAvatar(radius: 6, backgroundColor: Colors.green),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  technicianOrderModel.icon,
                  color: AppColors.grayBlue,
                  size: 40,
                ),
                SizedBox(width: 5),
                Text(
                  technicianOrderModel.serviceName,
                  style: AppTextStyles.semiBold20Black,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.grayBlue,
                  size: 30,
                ),
                SizedBox(width: 5),
                Text(
                  technicianOrderModel.placeDetails,
                  style: AppTextStyles.regular16Black,
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.taskDetailsScreen,
                  arguments: {
                    'orderId': technicianOrderModel.id,
                    'orderStatus': technicianOrderModel.state,
                    'price': technicianOrderModel.inspectedPrice,
                  },
                );
              },
              text: "بدء المهمة",
            ),
          ],
        ),
      ),
    );
  }
}
