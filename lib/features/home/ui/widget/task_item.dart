import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.build, color: Colors.blue),
          ),
          title: const Text("صيانة غسالة", style: AppTextStyles.regular16Black),
          subtitle: const Text(
            "عمرو حسن • أمس 04:30 م",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: const Text(
            "350+ ج.م",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
