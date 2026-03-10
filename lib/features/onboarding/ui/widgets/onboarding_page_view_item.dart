import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:herafy/core/theme/app_text_styles.dart';

class OnboardingPageViewItem extends StatelessWidget {
  const OnboardingPageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(image, fit: BoxFit.contain),
        Column(
          children: [
            Text(
              title,
              style: AppTextStyles.bold24DarkBlue,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular16GrayBlue,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
