
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class InformationWorkWidget extends StatelessWidget {
  const InformationWorkWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
  });
  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 18),
          const SizedBox(width: 5),
          Text(text, style: AppTextStyles.regular16Black),
        ],
      ),
    );
  }
}
