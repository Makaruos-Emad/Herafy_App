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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompactHeight = constraints.maxHeight < 520;
        final imageHeight = (constraints.maxHeight * 0.52).clamp(190.0, 360.0);
        final horizontalTextPadding = constraints.maxWidth < 360 ? 4.0 : 20.0;

        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: imageHeight,
                  width: double.infinity,
                  child: SvgPicture.asset(image, fit: BoxFit.contain),
                ),
                SizedBox(height: isCompactHeight ? 16 : 28),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalTextPadding,
                  ),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.bold24DarkBlue,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        description,
                        style: AppTextStyles.regular16GrayBlue,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
