
import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class WarningBanner extends StatelessWidget {
  final double width;

  const WarningBanner({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.shade800,
      ),
      child: Row(
        children: [
          const Icon(Icons.push_pin_outlined, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "سيتم تفعيل التواصل بعد تأكيد الطلب",
              style: AppTextStyles.regular12Black.copyWith(
                color: Colors.white,
                fontSize: width * 0.035,
              ),
            ),
          ),
        ],
      ),
    );
  }
}