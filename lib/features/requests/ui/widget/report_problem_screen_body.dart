import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_button.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';

class ReportProblemScreenBody extends StatelessWidget {
  const ReportProblemScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Icon(Icons.headphones, color: AppColors.primaryColor, size: 30),
            const SizedBox(width: 8),
            Text(
              "نحن هنا للاستماع، أخبرنا تفاصيل المشكلة",
              style: AppTextStyles.regular16Black,
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          hintText: "يرجى وصف المشكلة التي واجهتك بالتفصيل...",
          maxLines: 8,
        ),
        const SizedBox(height: 16),
        CustomButton(onPressed: () {}, text: "إرسال الشكوى"),
      ],
    );
  }
}
