
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/utils/app_images.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:herafy/features/service_request/widget/check_screen_widget/info_widget.dart';

class TaskDetailsbody extends StatelessWidget {
  const TaskDetailsbody({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kHorizontalPadding),
      child: Column(
        children: [
          BaseCard(
            child: Row(
              children: [
                CircleAvatar(
                  radius: height * 0.04,
                  backgroundImage: AssetImage(Assets.imagesUserImage),
                ),
                SizedBox(width: width * 0.03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "محمد عبد الحميد",
                      style: AppTextStyles.semiBold20Black,
                    ),
                    Text(
                      "٢٣ شارع التحرير، الدقي، الجيزة",
                      style: AppTextStyles.regular16GrayBlue,
                    ),
                  ],
                ),
                Spacer(),
                FaIcon(
                  FontAwesomeIcons.comment,
                  size: height * 0.03,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          BaseCard(
            padding: EdgeInsets.all(height * 0.02),
            child: Column(
              spacing: height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  value: "الأحد، 2 فبراير 2026\n10:00 صباحا",
                  width: width,
                ),
    
                const Divider(),
                Text("وصف العطل", style: AppTextStyles.semiBold20Black),
                Text(
                  "انسداد كامل في بلاعة الحمام الرئيسية، جربت مواد تسليك ومنفعتش. محتاج تسليك يدوي أو مكنة ضغط لأن المياه بترجع في البانيو",
                  style: AppTextStyles.regular16GrayBlue,
                ),
                SizedBox(height: height * 0.01),
                Row(
                  children: [
                    Text(
                      "سعر المعاينة",
                      style: AppTextStyles.semiBold20Black,
                    ),
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
          ),
        ],
      ),
    );
  }
}
