import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/widgets/icon_box.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.isPrice = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool isPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconBox(icon: icon),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: isPrice
                  ? AppTextStyles.bold16PrimaryColor
                  : AppTextStyles.regular16Black,
            ),
            if (subtitle != null)
              Text(subtitle!, style: AppTextStyles.regular12Black),
          ],
        ),
      ],
    );
  }
}
