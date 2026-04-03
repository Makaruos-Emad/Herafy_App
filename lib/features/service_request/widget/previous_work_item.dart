import 'package:flutter/material.dart';
import 'package:herafy/core/theme/app_text_styles.dart';
import 'package:herafy/core/utils/app_images.dart';

class PreviousWork extends StatelessWidget {
  const PreviousWork({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: 7,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => const PreviousWorkItem(),
      ),
    );
  }
}

class PreviousWorkItem extends StatelessWidget {
  const PreviousWorkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            Assets.imagesUserImage,
            height: 100,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        Text("إصلاح تسربات المياه", style: AppTextStyles.regular16Black),
      ],
    );
  }
}
