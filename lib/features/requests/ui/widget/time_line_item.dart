import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isDone;
  final bool isLast;
  final Color color;

  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isDone,
    required this.color,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: color,
              child: Icon(
                isDone ? Icons.check : Icons.circle,
                color: Colors.white,
                size: 22,
              ),
            ),
            if (!isLast) Container(width: 2, height: 70, color: Colors.grey),
          ],
        ),

        const SizedBox(width: 12),

        /// Text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.regular16Black.copyWith(
                  color: isDone ? color : Colors.black,
                ),
              ),
              if (subtitle.isNotEmpty)
                Text(subtitle, style: AppTextStyles.regular12Black),
            ],
          ),
        ),
      ],
    );
  }
}
