
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/info_widget.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/section_title.dart';

class ServiceDetailsCard extends StatelessWidget {
  final double width;
  final double height;
  final String formattedDate;
  final String formattedTime;
  final String address;
  final String governorate;
  final String center;

  const ServiceDetailsCard({
    super.key,
    required this.width,
    required this.height,
    required this.formattedDate,
    required this.formattedTime,
    required this.address,
    required this.governorate,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(width: width, text: "تفاصيل الخدمة"),
          const SizedBox(height: 10),

          InfoItem(
            icon: Icons.build,
            title: "نوع الخدمة",
            value: "معاينة سباكة",
            width: width,
          ),

          const Divider(),

          InfoItem(
            icon: Icons.calendar_today,
            title: "التاريخ والوقت",
            value: "$formattedDate\n$formattedTime",
            width: width,
          ),

          const Divider(),

          InfoItem(
            icon: Icons.location_on,
            title: "العنوان",
            value: "$address\n$center , $governorate",
            width: width,
          ),

          const Divider(),

          SectionTitle(width: width, text: "ملخص الدفع"),
          const SizedBox(height: 10),

          Row(
            children: [
              Text("سعر المعاينة", style: AppTextStyles.regular16GrayBlue),
              const Spacer(),
              Text(
                "50 ج.م",
                style: AppTextStyles.semiBold20Black.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: width * 0.06,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
