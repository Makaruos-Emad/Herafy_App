
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_colors.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/custom_text_form_field.dart';

class AddressSection extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const AddressSection({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("اكتب العنوان بالتحديد",
            style: AppTextStyles.semiBold20Black),
        SizedBox(height: height * 0.015),

        CustomTextFormField(
          controller: controller,
          hintText: "اكتب عنوان القرية والشارع والسكن",
          hintStyle: AppTextStyles.regular16GrayBlue,
          textInputType: TextInputType.name,
          prefixIcon: Icon(
            Icons.house_outlined,
            color: AppColors.primaryColor,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}