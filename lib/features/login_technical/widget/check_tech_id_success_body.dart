
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_constants.dart';
import 'package:herafy/core/widgets/base_card_container.dart';
import 'package:herafy/features/login_technical/widget/vertical_line.dart';
import 'package:herafy/features/login_technical/widget/were_data_arrive_items.dart';

class CheckTechIdSuccessBody extends StatelessWidget {
  const CheckTechIdSuccessBody({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Column(
          children: [
            Text(
              "طلبك قيد المراجعة حالياً",
              style: AppTextStyles.bold24DarkBlue,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),
            Text(
              "شكراً لك! لقد استلمنا بياناتك وجاري مراجعتها من قبل فريقنا. سيتم تفعيل حسابك خلال 24 ساعة كحد أقصى، وستصلك رسالة تنبيه فور الموافقة.",
              style: AppTextStyles.regular16GrayBlue,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.03),
            BaseCard(
              height: height * 0.4,
              child: Column(
                children: [
                  WereDataArrive(
                    height: height,
                    title: "تم استلام بياناتك بنجاح",
                    iconBackColor: Colors.green.shade200,
                    iconData: FontAwesomeIcons.circleCheck,
                    iconColor: Colors.green,
                  ),
                  VerticalLine(height: height, color: Colors.green.shade200),
                  SizedBox(height: height * 0.01),
                  WereDataArrive(
                    height: height,
                    subtitle: "قيد التنفيذ...",
                    title: "جاري المراجعة من قبل الفريق",
                    iconBackColor: const Color.fromARGB(255, 255, 225, 172),
                    iconData: FontAwesomeIcons.clock,
                    iconColor: Colors.orangeAccent,
                  ),
                  VerticalLine(height: height, color: Colors.grey.shade300),
                  SizedBox(height: height * 0.01),
                  WereDataArrive(
                    height: height,
                    title: "ستصلك رسالة تنبيه فور الموافقة",
                    iconBackColor: Colors.grey.shade300,
                    iconData: FontAwesomeIcons.bell,
                    iconColor: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            BaseCard(
              child: Row(
                spacing: height * 0.02,
                children: [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: AppColors.primaryColor,
                    size: height * 0.04,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: height * 0.003,
                    children: [
                      Text(
                        "الوقت المتوقع للمراجعة",
                        style: AppTextStyles.semiBold20Black,
                      ),
                      Text(
                        "من ساعة واحدة إلى 24 ساعة كحد أقصى",
                        style: AppTextStyles.bold16PrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
