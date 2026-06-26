import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:herafy/features/requests/model/technician_order_model.dart';
import 'package:intl/intl.dart';

class HistoryTechnicianRequestsItem extends StatelessWidget {
  const HistoryTechnicianRequestsItem({super.key, required this.request});

  final TechnicianOrderModel request;
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
                        'd MMMM hh:mm a',
                        'ar',
                      ).format(request.scheduledDate),
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: request.state == 'Completed'
                        ? Colors.green
                        : Colors.red,

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    request.state == 'Completed'
                        ? 'مكتمل'
                        : request.state == 'Canceled'
                        ? 'ملغي'
                        : "مرفوض",
                    style: AppTextStyles.regular16Black.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(request.serviceName, style: AppTextStyles.regular16Black),
            SizedBox(height: 8),
            Text(request.id.toString(), style: AppTextStyles.regular12Black),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.payments_outlined, color: AppColors.primaryColor),
                SizedBox(width: 5),
                Text("إجمالي المصنعية", style: AppTextStyles.regular12Black),
                SizedBox(width: 5),
                Text(
                  request.inspectedPrice.toString(),
                  style: AppTextStyles.bold16PrimaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
