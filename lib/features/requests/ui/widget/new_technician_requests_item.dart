import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_container.dart';
import 'package:herafy/core/widgets/icon_box.dart';
import 'package:herafy/features/requests/model/new_technician_requests_model.dart';
import 'package:herafy/features/requests/ui/widget/info_row.dart';

class NewTechnicianRequestsItem extends StatelessWidget {
  const NewTechnicianRequestsItem({
    super.key,
    required this.newTechnicianRequestsModel,
  });

  final NewTechnicianRequestsModel newTechnicianRequestsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomContainer(
          child: Column(
            children: [
              Row(
                children: [
                  IconBox(icon: Icons.build_outlined),
                  const SizedBox(width: 10),
                  Text(
                    newTechnicianRequestsModel.title,
                    style: AppTextStyles.regular16Black,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.access_time,
                    size: 20,
                    color: AppColors.grayBlue,
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "منذ 2 دقيقة",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              InfoRow(
                icon: Icons.location_on_outlined,
                title: newTechnicianRequestsModel.location,
                subtitle: newTechnicianRequestsModel.distance,
              ),
              const SizedBox(height: 16),
              InfoRow(
                icon: Icons.calendar_today_outlined,
                title: newTechnicianRequestsModel.dateTime,
              ),
              const SizedBox(height: 16),
              InfoRow(
                icon: Icons.attach_money,
                title: "${newTechnicianRequestsModel.price} ج.م",
                subtitle: "معاينة",
                isPrice: true,
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        CustomButton(text: "عرض التفاصيل", onPressed: () {}),
        const SizedBox(height: 16),
      ],
    );
  }
}
