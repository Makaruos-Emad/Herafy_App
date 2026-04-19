
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class WereDataArrive extends StatelessWidget {
  const WereDataArrive({
    super.key,
    required this.height,
    this.subtitle,
    required this.title,
    required this.iconBackColor,
    required this.iconData,
    this.iconColor,
  });

  final double height;
  final String title;
  final String? subtitle;
  final Color? iconBackColor;
  final FaIconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: height * 0.01,
          children: [
            CircleAvatar(
              radius: height * 0.035,
              backgroundColor: iconBackColor,
              child: FaIcon(iconData, color: iconColor, size: height * 0.04),
            ),
            Column(
              spacing: height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.semiBold20Black.copyWith(
                    color: iconColor,
                    fontSize: 18,
                  ),
                ),
                if (subtitle != null) ...[
                  Row(
                    children: [
                      Icon(Icons.circle, color: iconBackColor),
                      SizedBox(width: height * 0.01),
                      Text("$subtitle", style: AppTextStyles.regular16GrayBlue),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
      ],
    );
  }
}
