import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.regular16Black),
        GestureDetector(
          onTap: onTap,
          child: Text("عرض الكل", style: AppTextStyles.regular12PrimaryColor),
        ),
      ],
    );
  }
}
